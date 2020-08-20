#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';

use RennPoints::MyLaps::Event;
use RennPoints::MyLaps::Race;
use RennPoints::DB::Track;
use RennPoints::DBI qw( getDBConnection );
use RennPoints::PCA::Event;
use RennPoints::PCA::Race;
use RennPoints::ClubRacing;
use RennPoints::ClubRacing::Race;
use Data::Dumper;

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

	my %info = ( DESCRIPTION => scalar($cgi->param( "description_$i" )),
		     TRACK => scalar($cgi->param( "track_$i" )),
		     DATE => scalar($cgi->param( "date_$i" )),
		     URL => scalar($cgi->param( "url_$i" )),
		     ID => scalar($cgi->param( "id_$i" )),
		     EVENT => scalar($cgi->param( "event" )),
		     SESSION => scalar($cgi->param( "session_$i" )),
		     POINTS => scalar($cgi->param( "points_$i" )),
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
    parseMyLaps($event);

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

    my ( $mylapsid, $track, $year ) = $self->dbh->selectrow_array( "SELECT mylaps_id, track_id, year(date) FROM event WHERE event_id = ?", {}, $event_id );
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

	    if ( @sprints > 1 ) {
		$points_races{$sprints[1]->{session}} = 2;
	    }
	}
	if ( !@enduros && @sprints > 2 ) {
	    $points_races{$sprints[2]->{session}} = 2;
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

sub parseMyLaps {
    my $event = shift;

    populateFromMyLaps( $event );
    populateFromPCA( $event );
    populateFromClubRacing( $event );
}

sub populateFromMyLaps {
    my $event = shift;

    my $dbh = getDBConnection(1);

    my %CLASS_REMAP = ( 'GTC6C' => 'GTC6',
			'GTC7C' => 'GTC7',
			'GTD1C' => 'GTD',
	              );

    my $race_list = $dbh->selectall_arrayref( "SELECT distinct r.race_id, mylaps_id, session_type FROM race r WHERE event_id = ?", { Slice => {} }, $event );

    foreach my $race ( @$race_list ) {
	print STDERR "race_id=$race->{ race_id } mylaps_id=$race->{ mylaps_id }\n";

	my $israce = $race->{session_type} >=3 && $race->{session_type} <= 6 ? 1 : 0;
	my $participants = RennPoints::MyLaps::Race->new(id => $race->{mylaps_id})->participants();

	foreach my $result ( @$participants ) {
	    my $class = $result->{class};
	    my $position = $result->{overall_position};
	    my $classpos = $result->{class_position};
	    my $carnum = $result->{car_number};
	    my $name = $result->{name};
	    my $besttime = $result->{best_time},
	    my $lapnum = $result->{best_lap_number};
	    my $bestspeed = $result->{best_speed};
	    my $diff = $result->{overall_time_difference};
	    my $totaltime = $result->{total_time},
	    my $laps = $result->{laps};
	    my $transponder = $result->{transponder};
	    $carnum =~ s/\D//xg;
	    if ( $classpos =~ /^\d+$/x ) {
		$classpos = $classpos % 65536;
	    }

	    my $status = lc($result->{status}) eq "dnf" ? 2
		: lc($result->{status}) eq "dq"  ? 3
		: 1;

	    if ( $CLASS_REMAP{$class} ) {
		$class = $CLASS_REMAP{$class};	
	    }

	    my ( $count ) = $dbh->selectrow_array( "SELECT count(*) FROM results WHERE race_id = ? AND position_on_results_page = ?", {}, $race->{race_id}, $position );
	    if ( $count ) {
		my ( $tmpstatus ) = $dbh->selectrow_array( "SELECT status FROM results WHERE race_id = ? AND position_on_results_page = ?", {}, $race->{race_id}, $position );
		if ( $tmpstatus && $tmpstatus >= 3 && $status == 3 ) {
		    $status = $tmpstatus;
		}

		print STDERR " UPDATING BASE RECORD FOR $name $class $besttime $position\n";
		$dbh->do( "UPDATE results SET position = ?, position_on_results_page = ?, position_in_class = ?, full_name = ?, class = ?, laps_completed = ?, best_lap_time = ?, best_lap_time_lap_number = ?, status = ?, car_number = ?, transponder = ? WHERE race_id = ? AND position_on_results_page = ?", 
			  {}, $position, $position, $classpos, $name, $class, $laps, $besttime, $lapnum, $status, $carnum, $transponder, $race->{race_id}, $position );
	    }
	    else {
		print STDERR " INSERTING BASE RECORD FOR $name\n";
		$dbh->do( "INSERT INTO results ( race_id, position, position_on_results_page, position_in_class, car_number, transponder, full_name, class, laps_completed, best_lap_time, best_lap_time_lap_number, status, current_class ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
			  {}, $race->{race_id}, $position, $position, $classpos, $carnum, $transponder, $name, $class, $laps, $besttime, $lapnum, $status, $class );
	    }

	    if ( $israce ) {
		print STDERR  " UPDATING RECORD for race results\n";
		$dbh->do( "UPDATE results SET total_time = ?, time_difference = ? WHERE race_id = ? AND position_on_results_page = ?", 
			  {}, $totaltime, $diff, $race->{race_id}, $position );
	    }
	}
    }

    return;
}

sub populateFromPCA {
    my $event = shift;

    my $dbh = getDBConnection(1);
    my ($url) = $dbh->selectrow_array("SELECT pca_url FROM event WHERE event_id = ?", {}, $event );
    return unless $url =~ m{://};

    my $pca = RennPoints::PCA::Event->new(url => $url);
    my $races = $pca->races;

    foreach my $race_name ( @$races ) {
	print STDERR "parsing $race_name\n";
	my $race = RennPoints::PCA::Race->new(content => $pca->content, race => $race_name);
	my $participants = $race->participants;

	foreach my $participant ( @$participants ) {
	    my $data = $dbh->selectall_arrayref( "SELECT R.race_id, R.position_on_results_page FROM results R, race E WHERE ( full_name LIKE ? OR car_number = ? ) AND class = ? and ( best_lap_time_lap_number = ? OR ? IS NULL ) AND ABS(best_lap_time - ?) < .001 AND ABS(total_time - ?) < .01 AND R.race_id = E.race_id AND E.event_id = ? AND E.session_type IN (3,4,5)", { Slice => {} },
						'%' . $participant->{name} . '%',
						 $participant->{car_number},
						$participant->{class},
						$participant->{best_lap_number},
						$participant->{best_lap_number},
						$participant->{best_time},
						$participant->{total_time},
						$event );

	    if ( @$data == 1 ) {
		# print STDERR "Found 1 : $participant->{name} $participant->{class}\n";
		$dbh->do( "UPDATE results SET car_color = ?, car_description = ?, driver_region = ? WHERE race_id = ? AND position_on_results_page = ?", {},
			  $participant->{color},
			  $participant->{description},
			  $participant->{region},
			  $data->[0]->{race_id},
			  $data->[0]->{position_on_results_page},
		        );
	    }
	    else {
		my $count = @$data;
		print STDERR "FOUND $count : $race_name ", Dumper( $participant ), "\n";
	    }
	}
    }

    return;
}

sub populateFromClubRacing {
    my $event = shift;

    my $dbh = getDBConnection(1);
    my ($description) = $dbh->selectrow_array("SELECT pca_url FROM event WHERE event_id = ?", {}, $event );

    my $clubracing = RennPoints::ClubRacing->new();
    my ( $clubracing_event ) = grep { $_->{description} eq $description } @{$clubracing->events};

    my $races = $clubracing_event->{event}->races;

    foreach my $race_name ( @$races ) {
	print STDERR "parsing $race_name\n";
	my $race = RennPoints::ClubRacing::Race->new(url => $race_name );
	my $participants = $race->participants;

	foreach my $participant ( @$participants ) {
	    my $data = $dbh->selectall_arrayref( "SELECT R.race_id, R.position_on_results_page FROM results R, race E WHERE ( full_name LIKE ? OR car_number = ? ) AND class = ? and ( best_lap_time_lap_number = ? OR ? IS NULL ) AND ( ABS(best_lap_time - ?) < .001 OR ( ? IS NULL AND best_lap_time = 0 ) )AND R.race_id = E.race_id AND E.event_id = ? AND E.session_type IN (3,4,5)", { Slice => {} },
						'%' . $participant->{name} . '%',
						 $participant->{car_number},
						$participant->{class},
						$participant->{best_lap_number},
						$participant->{best_lap_number},
						$participant->{best_time},
						$participant->{best_time},
						$event );

	    if ( @$data == 1 ) {
                # print "Found 1 : $participant->{name} $participant->{class}\n";
		$dbh->do( "UPDATE results SET car_color = ?, car_description = ?, driver_region = ? WHERE race_id = ? AND position_on_results_page = ?", {},
			  $participant->{color},
			  $participant->{description},
			  $participant->{region},
			  $data->[0]->{race_id},
			  $data->[0]->{position_on_results_page},
		        );
	    }
	    else {
		my $count = @$data;
		print STDERR  "FOUND $count : $race_name ", Dumper( $participant ), "\n";
	    }
	}
    }

    return;
}


