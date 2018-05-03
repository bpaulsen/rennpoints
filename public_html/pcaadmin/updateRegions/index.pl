#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use RennPoints qw( getDBConnection );

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $dbh = $self->dbh;

    my $year = 2013;
    my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.racer_id, S.full_name, RA.givenname, RA.surname FROM results S, race R, racer RA WHERE RA.racer_id = S.racer_id AND S.race_id = R.race_id AND YEAR(R.date) = ? AND NOT EXISTS( SELECT 1 FROM racer_regions RR WHERE S.racer_id = RR.racer_id AND year = ? ) AND (coracer_id IS NULL OR coracer_id = 0) LIMIT 0,25", { Slice => {} }, $year, $year );

    my @racerRegions;
    foreach my $racer ( @$racers ) {
	my $racerlist = $dbh->selectall_arrayref( "SELECT * FROM racer_regions WHERE last_name = ? AND first_name = ? AND year = ? AND racer_id = 0", { Slice => {} }, $racer->{surname}, $racer->{givenname}, $year );

	if ( !@$racerlist ) {
	    $racerlist = $dbh->selectall_arrayref( "SELECT * FROM racer_regions WHERE last_name = ? AND year = ? AND racer_id = 0", { Slice => {} }, $racer->{surname}, $year );
	}

	if ( !@$racerlist ) {
	    $racerlist = $dbh->selectall_arrayref( "SELECT * FROM racer_regions WHERE first_name = ? AND year = ? AND racer_id = 0", { Slice => {} }, $racer->{givenname}, $year );
	}

	next if !@$racerlist;

	foreach my $i ( @$racerlist ) {
	    my $matches = $dbh->selectall_arrayref( "SELECT RA.racer_id, RA.clubreg_name FROM racer RA WHERE MATCH(RA.clubreg_name) AGAINST ( ? ) AND EXISTS(SELECT 1 FROM results R WHERE RA.racer_id = R.racer_id OR R.coracer_id = RA.racer_id )", { Slice => {} }, "$i->{first_name} $i->{last_name}" );
	    $i->{matches} = $matches;
	    push @racerRegions, $i;
	}
    }

    @racerRegions = sort { $a->{last_name} cmp $b->{last_name} || $a->{first_name} cmp $b->{last_name} } @racerRegions;

    return $self->tt_process('updateRacers.html',
			     { RACERS => \@racerRegions,
			     },
	);
}

sub update_racers : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $count = $cgi->param( "racer_count" );
    my $dbh = $self->dbh;

    foreach my $i ( 1 .. $count ) {
	my $racer_id = $cgi->param( "racer_$i" );
	next if !$racer_id;

	$dbh->do( "UPDATE racer_regions SET racer_id = 0 WHERE racer_id = ? AND year = ?", {}, $racer_id, $cgi->param( "year_$i" ) );
	$dbh->do( "UPDATE racer_regions SET racer_id = ? WHERE first_name = ? AND last_name = ? AND year = ? AND zone = ? and region = ?", {}, 
		  $racer_id, 
		  $cgi->param( "firstname_$i" ),
		  $cgi->param( "lastname_$i" ),
		  $cgi->param( "year_$i" ),
		  $cgi->param( "zone_$i" ),
		  $cgi->param( "region_$i" ),
	    );
    }

    return $self->main_page();
}

sub setup {
    my $self = shift;
 
    # Configure the DB connection
    $self->dbh_config(sub { getDBConnection(1); } );

    return;
}
