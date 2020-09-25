#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use RennPoints qw( hasCodriver populateRacerIdsForEventUsingRegion populateRacerIdsForEvent getRecentEvents insertRacerIntoDB );
use Data::Dumper;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $events = getRecentEvents($self->dbh);

    my $event = $cgi->param( "event" );
    my $racers;
    my $useTransponders = 1;
    my $count = 0;
    if ( $event ) {
	if ( $useTransponders ) {
	    populateRacerIdsForEvent( $self->dbh, $event );
	    $racers = getUnidentifiedRacersUsingTransponder( $self->dbh, $event );
	}
	else {
	     populateRacerIdsForEventUsingRegion( $self->dbh, $event );
	     $racers = getUnidentifiedRacers( $self->dbh, $event );
	}

	$count = getIdentifiedRacerCount( $self->dbh, $event );
    }

    return $self->tt_process('updateRacers.html',
			     {
			       EVENTS => $events,
			       RACERS => $racers,
			       COUNT => $count,
			     },
	);
}

sub getIdentifiedRacerCount {
    my $dbh = shift;
    my $event = shift;

    my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND S.racer_id IS NOT NULL AND IFNULL(S.full_name, '') != 'SESSION CANCELLED' ORDER BY 1", { Slice => {} }, $event );

    return $count;
}

sub getUnidentifiedRacers {
    my $dbh = shift;
    my $event = shift;

    my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND ( S.racer_id IS NULL OR S.coracer_id IS NULL ) AND IFNULL(S.full_name, '') != 'SESSION CANCELLED' ORDER BY 1", { Slice => {} }, $event );

    foreach my $i ( @$racers ) {
	$i->{ codriver } = hasCodriver( $i->{full_name} );

	my $matches = $dbh->selectall_arrayref( "SELECT racer_id, clubreg_name FROM racer WHERE MATCH(clubreg_name) AGAINST ( ? )", { Slice => {} }, $i->{full_name} );
	$i->{matches} = $matches;
    }

    return $racers;
}

sub getUnidentifiedRacersUsingTransponder {
    my $dbh = shift;
    my $event = shift;

    my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name, IFNULL(S.transponder,0) AS 'transponder' FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND ( S.racer_id IS NULL OR S.coracer_id IS NULL ) AND IFNULL(S.full_name, '') != 'SESSION CANCELLED' ORDER BY 1", { Slice => {} }, $event );

    foreach my $i ( @$racers ) {
	$i->{ codriver } = hasCodriver( $i->{full_name} );

	my $matches = $dbh->selectall_arrayref( "SELECT racer_id, clubreg_name FROM racer WHERE MATCH(clubreg_name) AGAINST ( ? )", { Slice => {} }, $i->{full_name} );

	my $morematches = $dbh->selectall_arrayref( "SELECT full_name, racer_id, COUNT(*) AS 'count' FROM results WHERE transponder = ? AND racer_id IS NOT NULL AND coracer_id = 0 GROUP BY full_name, racer_id ORDER BY 3 DESC", { Slice => {} }, $i->{transponder} );
	
	my %seen = map { $_->{ racer_id } => $_ } @$matches;
	foreach my $j ( @$morematches ) {
	    if ( $seen{ $j->{racer_id } } ) {
		$seen{$j->{racer_id}}->{clubreg_name} = "$j->{ full_name } ($j->{count})";
		next;
	    }
	    push @$matches, { racer_id => $j->{ racer_id },
			      clubreg_name => "$j->{ full_name } ($j->{count})",
	                    };
	    $seen{ $j->{racer_id } } = $j;
	}

	$i->{matches} = $matches;
    }

    return $racers;
}

sub update_racers : Runmode {
    my $self = shift;
    my $cgi = $self->query;
    my $dbh = $self->dbh;

    my @names = $cgi->param();
    my $event_id = $cgi->param("event");
    my ( $year ) = $dbh->selectrow_array( "SELECT YEAR(date) FROM event WHERE event_id = ?", {}, $event_id );
    foreach my $i ( @names ) {
	next if $i eq "processresults";
	next if $i eq "event";
	next if $i eq "rm";
	next if $i =~ /^EVENT_/x;

	my $racerid = $cgi->param( $i );
	next if $racerid == 0;
	my ( $codriver, $name ) = $i =~ /(\d+)~(.*)/x;
	my $event = $cgi->param( "EVENT_$name" ) ? $cgi->param('event') : 0;

	my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM racer_keys WHERE full_name = ? AND codriver = ? AND race_id = ?", {}, $name, $codriver, $event );
	if ( !$count ) {
	    $dbh->do( "INSERT racer_keys ( racer_id, full_name, race_id, codriver ) values ( ?, ?, ?, ? )", {}, $racerid, $name, $event, $codriver );
	    # print STDERR "INSERT racer_keys ( racer_id, full_name, race_id, codriver ) values ( $racerid, $name, $event, $codriver )\n";
	}
	else {
	    $dbh->do( "UPDATE racer_keys SET racer_id = ? WHERE codriver = ? AND full_name = ? AND race_id = ?", {}, $racerid, $codriver, $name, $event );
	}

	my $matches = $dbh->selectall_arrayref( "SELECT DISTINCT first_name, last_name, driver_region, full_name FROM results S, race R WHERE S.race_id = R.race_id AND R.event_id = ? AND S.full_name = ? AND driver_region IS NOT NULL", {Slice => {}}, $event_id, $name );
	# print STDERR "'$i' '$racerid' '$event' '$codriver' '$name' '$count'\n";
	# print STDERR Dumper($matches);
	my @matches = grep { !hasCodriver($_->{full_name}) } @$matches;

	if ( @matches == 1 ) {
	    my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM racer_regions WHERE first_name = ? AND last_name = ? AND region = ? AND year = ? AND racer_id = 0", {}, $matches[0]->{first_name}, $matches[0]->{last_name}, $matches[0]->{driver_region}, $year );
	    # print STDERR "'$i' '$racerid' '$event' '$codriver' '$name' '$count'\n";
	    if ( $count == 1 ) {
		$dbh->do( "UPDATE racer_regions SET racer_id = ? WHERE first_name = ? AND last_name = ? AND region = ? AND year = ? AND racer_id = 0", {}, $racerid, $matches[0]->{first_name}, $matches[0]->{last_name}, $matches[0]->{driver_region}, $year );
	    }
	}
    }

    return $self->main_page;
}

sub update_racers_with_transponder : Runmode {
    my $self = shift;
    my $cgi = $self->query;
    my $dbh = $self->dbh;

    my @names = $cgi->param();
    foreach my $i ( @names ) {
	next if $i eq "processresults";
	next if $i eq "event";
	next if $i =~ /^EVENT_/x;
	my $racerid = $cgi->param( $i );
	next if $racerid == 0;
	my ( $codriver, $transponder, $name ) = $i =~ /(\d+)~(\d+)~(.*)/x;
	my $event = $cgi->param( "EVENT_$transponder~$name" ) ? $cgi->param('event') : 0;

	my $count = $dbh->selectrow_array( "SELECT COUNT(*) FROM racer_keys WHERE full_name = ? AND transponder = ? AND codriver = ? AND race_id = ?", {}, $name, $transponder, $codriver, $event );
	if ( !$count ) {
	    $dbh->do( "INSERT racer_keys ( racer_id, full_name, transponder, race_id, codriver ) values ( ?, ?, ?, ?, ? )", {}, $racerid, $name, $transponder, $event, $codriver );
	    print STDERR "INSERT racer_keys ( racer_id, full_name, transponder, race_id, codriver ) values ( $racerid, $name, $transponder, $event, $codriver )\n";
	}
	else {
	    $dbh->do( "UPDATE racer_keys SET racer_id = ? WHERE codriver = ? AND full_name = ? AND transponder = ? AND race_id = ?", {}, $racerid, $codriver, $name, $transponder, $event );
	}
    }

    return $self->main_page;
}

sub new_racer : Runmode {
    my $self = shift;
    my $cgi = $self->query;
    my $dbh = $self->dbh;

    my $name = $cgi->param( "name" );
    my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM racer_keys WHERE full_name = ?", {}, $name );
    if ( !$count ) {
	my $data = $dbh->selectall_arrayref( "SELECT DISTINCT first_name, last_name FROM results WHERE full_name = ? AND IFNULL(racer_id,0) = 0 AND first_name IS NOT NULL", {Slice => {} }, $name );
	if ( @$data == 1 ) {
	    $dbh->do( "INSERT racer ( clubreg_name, surname, givenname ) VALUES ( ?, ?, ? )", {}, "$data->[0]->{last_name}, $data->[0]->{first_name}", $data->[0]->{last_name}, $data->[0]->{first_name} );
	    my ( $id ) = $dbh->selectrow_array( "SELECT racer_id FROM racer WHERE clubreg_name = ?", {}, "$data->[0]->{last_name}, $data->[0]->{first_name}" );
	    $dbh->do( "INSERT racer_keys ( racer_id, full_name ) VALUES ( ?, ? )", {}, $id, $name );
	}
	else {
	    my $id = insertRacerIntoDB( $dbh, $name );
	    $dbh->do( "INSERT racer_keys ( racer_id, full_name ) VALUES ( ?, ? )", {}, $id, $name );
	}
    }

    return $self->main_page;
}
