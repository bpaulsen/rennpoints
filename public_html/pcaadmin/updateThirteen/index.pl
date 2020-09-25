#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $dbh = $self->dbh;

    my $year = 2013;

    my $racers = $dbh->selectall_arrayref( "SELECT * FROM thirteen WHERE year = ? AND racer_id = 0", { Slice => {} }, $year );
    my @thirteens;

    foreach my $i ( @$racers ) {
	print STDERR "matching $i->{first_name} $i->{last_name}\n";
	my $matches = $dbh->selectall_arrayref( "SELECT RA.racer_id, RA.clubreg_name FROM racer RA WHERE MATCH(RA.clubreg_name) AGAINST ( ? ) AND EXISTS(SELECT 1 FROM results R WHERE RA.racer_id = R.racer_id OR R.coracer_id = RA.racer_id )", { Slice => {} }, "$i->{first_name} $i->{last_name}" );
	# my $matches = $dbh->selectall_arrayref( "SELECT RA.racer_id, RA.clubreg_name FROM racer RA WHERE MATCH(RA.clubreg_name) AGAINST ( ? )", { Slice => {} }, "$i->{first_name} $i->{last_name}" );
	print STDERR "matched $i->{first_name} $i->{last_name}\n";
	$i->{matches} = $matches;
	push @thirteens, $i;
    }

    @thirteens = sort { $a->{last_name} cmp $b->{last_name} || $a->{first_name} cmp $b->{last_name} } @thirteens;

    return $self->tt_process('updateThirteen.html',
			     { RACERS => \@thirteens,
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

	$dbh->do( "UPDATE thirteen SET racer_id = 0 WHERE racer_id = ? AND year = ?", {}, $racer_id, $cgi->param( "year_$i" ) );
	$dbh->do( "UPDATE thirteen SET racer_id = ? WHERE first_name = ? AND last_name = ? AND year = ?", {},
		  $racer_id, 
		  $cgi->param( "firstname_$i" ),
		  $cgi->param( "lastname_$i" ),
		  $cgi->param( "year_$i" ),
	    );
    }

    return $self->main_page();
}
