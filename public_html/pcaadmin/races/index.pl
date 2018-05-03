#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';

use RennPoints::MyLaps::Event;
use RennPoints::MyLaps::Race;
use RennPoints::DB::Track;

 __PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $track_data = RennPoints::DB::Track->new( dbh => $self->dbh )->track_list;
    my %tracks = map { $_->{ track_id } => $_->{ name } } @$track_data;

    my $events = $self->getRecentEvents;
    my $races = $self->getRaces( scalar($cgi->param("event")) );

    return $self->tt_process('updateRaces.html',
			     { RACES =>   $races,
			       TRACKS => \%tracks,
			       EVENTS => $events,
			     },
	);
}

sub update_races : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $count = $cgi->param( "race_count" );

    my $dbh = $self->dbh();
    foreach my $i ( 1 .. $count ) {
	next if !$cgi->param( "check_$i" );

	my %info = ( DESCRIPTION => $cgi->param( "description_$i" ),
		     TRACK => $cgi->param( "track_$i" ),
		     DATE => $cgi->param( "date_$i" ),
		     URL => $cgi->param( "url_$i" ),
		     ID => $cgi->param( "id_$i" ),
		     EVENT => $cgi->param( "event" ),
		     SESSION => $cgi->param( "session_$i" ),
		     POINTS => $cgi->param( "points_$i" ),
	           );

	my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM race WHERE mylaps_id = ?", {}, $info{ID} );
	if ( $count ) {
	    $dbh->do( "UPDATE race SET event_id = ?, date = ?, session_type = ?, description = ?, track_id = ?, points_type_2 = ?, mylaps_url = ? where mylaps_id = ?", 
		      {}, $info{EVENT}, $info{DATE}, $info{SESSION}, $info{DESCRIPTION}, $info{TRACK}, $info{POINTS}, $info{URL}, $info{ID} );
	}
	else {
	    $dbh->do( "INSERT INTO race ( event_id, date, session_type, description, mylaps_url, mylaps_id, track_id, points_type_2 ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ? )",
		      {}, $info{EVENT}, $info{DATE}, $info{SESSION}, $info{DESCRIPTION}, $info{URL}, $info{ID}, $info{TRACK}, $info{POINTS} );
	}
    }

    my $event = $cgi->param("event");
    print STDERR "./parseMyLaps.pl $event 2>&1 /dev/null\n";
    # system( "./parseMyLaps.pl $event 2>&1 /dev/null" );
    system( "./parseMyLaps.pl $event" );

    # system( "./parseMyLaps.pl $event 2>&1 /var/log/httpd/error_log" );

    return $self->main_page();
}

sub getRecentEvents {
    my $self = shift;

    my $events = $self->dbh->selectall_arrayref( "SELECT E.event_id, E.description, E.date, ( SELECT COUNT(*) FROM race R WHERE E.event_id = R.event_id ) AS 'races' FROM event E WHERE E.event_id NOT IN ( 135, 278, 396 ) ORDER BY CASE WHEN races = 0 THEN 0 ELSE 1 END, E.date DESC LIMIT 0,30", { Slice => {} } );

    my @list;
    foreach my $i ( @$events ) {
	push @list, { $i->{event_id} => "$i->{date} : $i->{description} ($i->{races} races)" }
    }

    return \@list;
}

sub getRaces {
    my $self = shift;
    my $event_id = shift || return;

    my ( $mylapsid, $track ) = $self->dbh->selectrow_array( "SELECT mylaps_id, track_id FROM event WHERE event_id = ?", {}, $event_id );
    my $event = RennPoints::MyLaps::Event->new(id => $mylapsid);
    my $races = $event->races;

    # 'session' => 'Orange Race Group - Sprint Race 2',
    # 'id' => '4345725',
    # 'datetime' => '04/22/2017 15:10'
    
    my $raceInfo = $self->dbh->selectall_hashref( "SELECT mylaps_id, points_type_2, track_id, date, session_type, description, (SELECT COUNT(*) FROM results S WHERE race.race_id = S.race_id) AS 'race_count' FROM race WHERE event_id = ?", "mylaps_id", {}, $event_id );

    my @results;
    foreach my $race ( @$races ) {
	$race->{session_type} = $race->{session} =~ /Fun/ix || $race->{session} =~ /Practice\s+Start/ix ? 6
	    : $race->{session} =~ /Night.*Sprint/ix       ? 5
	    : $race->{type} eq "practice"                 ? 1
	    : $race->{type} =~ /Qualify/ix                ? 2
	    : $race->{type} =~ /Enduro/ix                 ? 4
	    : $race->{session} =~ /Enduro/ix && $race->{type} eq 'race' ? 4
	    : $race->{type} eq "race"                     ? 3
	    : 0;
    }

    my %points_races;
    my @enduros = grep { $_->{session_type} == 4 } @$races;
    foreach my $race ( @enduros ) {
	$points_races{$race->{session}} = 2;  # 2 is the points type for a regular race
    }

    my %groups = map { $_->{group} => 1 } @$races;
    foreach my $group ( keys %groups ) {  # now mark the sprint final race(s) of each group as regular races
	my @sprints = grep { $_->{session_type} == 3 && $_->{group} eq $group } @$races;
	@sprints = sort { $b->{datetime} cmp $a->{datetime} } @sprints;
	if ( @sprints ) {
	    $points_races{$sprints[0]->{session}} = 2;
	}
	if ( !@enduros && @sprints > 1 ) {
	    $points_races{$sprints[1]->{session}} = 2;
	}
    }

    foreach my $race ( @$races ) {
	my $id = $race->{id};

	push @results, { EVENT       => $event,
			 DATE        => $race->{datetime},
			 SESSION     => $raceInfo->{$id}->{session_type} || $race->{session_type},
			 DESCRIPTION => $raceInfo->{$id}->{description} || $race->{session},
			 URL         => RennPoints::MyLaps::Race->new(id => $id)->url,
			 ID          => $id,
			 TRACK       => $raceInfo->{$id}->{track_id} || $track,
			 POINTS      => $raceInfo->{$id}->{points_type_2} || $points_races{$race->{session}} || 1,
			 STATUS      => defined($raceInfo->{$id}->{mylaps_id}) && $raceInfo->{$id}->{race_count} > 0 ? "SAVED RACE" : "NEW RACE",
			 STATUSTYPE  => defined($raceInfo->{$id}->{mylaps_id}) ? 2 : 1,
	};
    }
    return \@results;
}
