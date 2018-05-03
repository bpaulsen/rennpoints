#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints::DBI qw( getDBConnection );
use RennPoints::MyLaps::Race;
use RennPoints::PCA::Event;
use RennPoints::PCA::Race;
use RennPoints::ClubRacing;
use RennPoints::ClubRacing::Race;
use Data::Dumper;

my $DEBUG = 0;
my $event = shift || die "Please pass in an event id\n";

populateFromMyLaps( $event );
populateFromPCA( $event );
populateFromClubRacing( $event );

sub populateFromMyLaps {
    my $event = shift;

    my $dbh = getDBConnection(1);

    my $race_list = $dbh->selectall_arrayref( "SELECT distinct r.race_id, mylaps_id, session_type FROM race r WHERE event_id = ?", { Slice => {} }, $event );

    foreach my $race ( @$race_list ) {
	print "$race->{ race_id } $race->{ mylaps_id }\n";

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

	    my ( $count ) = $dbh->selectrow_array( "SELECT count(*) FROM results WHERE race_id = ? AND position_on_results_page = ?", {}, $race->{race_id}, $position );
	    if ( $count ) {
		my ( $tmpstatus ) = $dbh->selectrow_array( "SELECT status FROM results WHERE race_id = ? AND position_on_results_page = ?", {}, $race->{race_id}, $position );
		if ( $tmpstatus && $tmpstatus >= 3 && $status == 3 ) {
		    $status = $tmpstatus;
		}

		print " UPDATING BASE RECORD FOR $name $class $besttime $position\n";
		$dbh->do( "UPDATE results SET position = ?, position_on_results_page = ?, position_in_class = ?, full_name = ?, class = ?, laps_completed = ?, best_lap_time = ?, best_lap_time_lap_number = ?, status = ?, car_number = ?, transponder = ? WHERE race_id = ? AND position_on_results_page = ?", 
			  {}, $position, $position, $classpos, $name, $class, $laps, $besttime, $lapnum, $status, $carnum, $transponder, $race->{race_id}, $position );
	    }
	    else {
		print " INSERTING BASE RECORD FOR $name\n";
		$dbh->do( "INSERT INTO results ( race_id, position, position_on_results_page, position_in_class, car_number, transponder, full_name, class, laps_completed, best_lap_time, best_lap_time_lap_number, status, current_class ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
			  {}, $race->{race_id}, $position, $position, $classpos, $carnum, $transponder, $name, $class, $laps, $besttime, $lapnum, $status, $class );
	    }

	    if ( $israce ) {
		print " UPDATING RECORD for race results\n";
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
	print "parsing $race_name\n";
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
		print "FOUND $count : $race_name ", Dumper( $participant ), "\n";
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
	print "parsing $race_name\n";
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
		print "FOUND $count : $race_name ", Dumper( $participant ), "\n";
	    }
	}
    }

    return;
}

