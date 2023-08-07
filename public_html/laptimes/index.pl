#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( getAllClassRecords getLapTimePrediction formatTime insertRacerIntoDB myLapsURL );
use RennPoints::DBI qw( getDBConnection );
use RennPoints::ClubRegistration::Event;
use HTML::Template;
use Carp qw(croak);
use List::Util qw( sum first );
use HTTP::BrowserDetect;
use Data::Dumper;
use CGI;
use RennPoints::Config;
use Storable qw( freeze thaw );
use File::Basename qw(dirname);

printPage();

sub printPage {
    my $cgi = CGI->new();
    my $dbh = getDBConnection( 1 );

    my $browser = HTTP::BrowserDetect->new();

    foreach my $i ( sort keys %ENV ) {
	# print STDERR "$i:$ENV{$i}\n";
    }

    my ( $trackids, $trackValues ) = getTracks( $dbh );

    my ( $times, $races, $startdate, $enddate, $clubregid, $trackid );
    my ( $google_lat, $google_lng, $google_zoom, $google_width, $google_height, $registration_open, $registration_date );

    my $event = $cgi->param("event");
    if ( !$event && $#$trackids == 0 ) {
	$event = $trackids->[0];
	$cgi->param( "event" => $event ) if $event;
    }

    if ( $event && $event =~ /^(\d+)$/x ) {
	( $startdate, $enddate, $trackid, $clubregid, $google_lat, $google_lng, $google_zoom, $google_width, $google_height, $registration_open, $registration_date ) = $dbh->selectrow_array( "select date_format(date, '%c/%e'), date_format(end_date, '%c/%e'), c.track_id, clubreg_id, google_lat, google_lng, google_zoom, google_width, google_height, case when date_add(registration, interval 22 hour) <= now() then 1 else 0 end as 'registration_open', date_format(registration, '%c/%e') as 'registration' from clubreg_urls c, track t where c.clubreg_id = ? and end_date >= CURDATE() and t.track_id = c.track_id and IFNULL(c.cancelled,0) != 1", {}, $event );

	if ( $registration_open ) {
	    ( $times, $races ) = getRacersTimes( $dbh, $1, $cgi->param( "race" ) || "", $cgi->param("ignorecache") || 0 );
	}
	else {
	    $times = [];
	}
    }

    if ( $browser->user_agent() =~ /(\d)x(\d+)$/x ) {
	my $width = $1;
	$google_lat = 0;
    }

    my $track_popup = $cgi->popup_menu( -name   => "event",
					-title => "event",
					-values => [ "Choose A Track", @$trackids ],
					-labels => $trackValues,
					-default => $event || "Choose A Track",
					-onchange => "submit();",
	);

    my $race_popup;

    if ( $#$races >= 0 ) {
	$race_popup = $cgi->popup_menu( -name   => "race",
					-values => [ "", @$races ],
					-labels => { "" => "Choose a Race" },
					-default => "",
					-onchange => "submit();",
	    );
    }

    my $template = HTML::Template->new(filename => dirname($ENV{SCRIPT_FILENAME}) . "/laptimes.html",
#				       INCLUDE_PATH => dirname($ENV{SCRIPT_FILENAME}),
#				       RELATIVE => 1,
#				       ABSOLUTE => 1,
				       associate => $cgi,
				       global_vars => 1,
				       die_on_bad_params => 0,
				       loop_context_vars => 1,
	);

    $template->param( laptimestab => 1,
		      BASEURL => "../",
	);

    $template->param( track_popup => $track_popup );
    $template->param( race_popup => $race_popup );

    # print STDERR Dumper($times);

    if ( $times ) {
	$template->param( results   => $times,
			  startdate => $startdate,
			  enddate   => $enddate,
			  registration_open => $registration_open,
			  registration_date => $registration_date,
			  clubregid => $clubregid,
			  track     => $trackid,
	                );

	if ( $google_lat ) {
	    my $config = RennPoints::Config->new( context => 'GoogleMaps' );

	    $template->param( google_lat    => $google_lat,
			      google_lng    => $google_lng,
			      google_zoom   => $google_zoom,
			      google_width  => $google_width,
			      google_height => $google_height,
			      google_key    => $config->get("key"),
 		            );
	}

	if ( $cgi->param("race" ) && first { $_ eq $cgi->param("race") } @$races ) {
	    $template->param( racers => 1 + $#$times );
	}
	else {
	    $cgi->delete("race");
	    $template->param( racers => sum( map { $#{$_->{classResults}} + 1 } @$times ) );
	}
    }
    

    # send the obligatory Content-Type and print the template output
    print $cgi->header;
    print $template->output;
    return;
}

sub getRacersTimes {
    my $dbh = shift;
    my $clubregid = shift;
    my $race = shift;
    my $ignorecache = shift;

    my @rows = getParticipants($clubregid);

    my ( $trackid ) = $dbh->selectrow_array("SELECT track_id FROM clubreg_urls WHERE clubreg_id = ? AND end_date >= CURDATE()", {}, $clubregid );

    my %classes;
    my $classRecords = getAllClassRecords( $dbh );
    my %races;
    my @races;

    foreach my $row ( @rows ) {
	my $name       = $row->{name};
	my $car        = $row->{car};
	my $class      = $row->{class};
	my $pca_race   = $row->{race};
	my $number     = $row->{number};

	if ( ( $pca_race && lc($pca_race) ne "unassigned" ) ) {
	    push @races, $pca_race if !$races{$pca_race}++;
	}

	$classes{$class}->{$name} = $car;
    }

    my $key = "laptimesTimes.$trackid";
    my $data;
    my ( $thaw ) = $dbh->selectrow_array( "SELECT value FROM cache C JOIN cacheTimestamp T ON C.ts > T.lastUpdate WHERE cache_key = ?", {}, $key );
    if ( !$ignorecache && $ENV{SCRIPT_FILENAME} && $thaw ) {
	$data = thaw $thaw;
    }

    my @results;
    foreach my $class ( sort { length($a) <=> length($b) || $a cmp $b } ( keys %classes ) ) {
	my @classResults;
	my $oldClassResults;
	if ( $data ) {
	    ( $oldClassResults ) = grep { $_->{class} eq $class } @$data;
	}
	foreach my $racer ( sort { $a cmp $b } keys %{$classes{$class}} ) {
	    my $oldRacerResults;
	    if ( $oldClassResults ) {
		( $oldRacerResults ) = grep { $_->{racername} eq $racer && $_->{hasnulls} == 0 } @{$oldClassResults->{classResults}};
		if ( $oldRacerResults ) {
		    $oldRacerResults->{racercar} = $classes{$class}->{$racer};
		    push @classResults, $oldRacerResults;
		    next;
		}
	    }
	    if ( !$oldRacerResults ) {
		my $id = insertRacerIntoDB( $dbh, $racer );
		my $times = getBestTimes( $dbh, $trackid, $racer, $class, $classRecords, $id );
		my @racerResults;
		my $hasnulls = 0;
		foreach my $row ( @$times ) {
		    $hasnulls = 1 if $row->[6] > 0;
		    next if $row->[2] < 10;
		    
		    my %result = ( "resultname" => $row->[0],
				   "resultclass" => $row->[1],
				   "resulttime" => formatTime($row->[2]),
				   "resultdate" => $row->[3],
				   "resulturl"  => $row->[4],
				   "realtime" => $row->[2],
				   "resultcurrentclass" => $row->[5],
			);
		    push @racerResults, \%result;
		}
		push @classResults, { "racername" => $racer,
				      "racerclass" => $class,
				      "racercar" => $classes{$class}->{$racer},
				      "racerResults" => \@racerResults,
				      "hasnulls" => $hasnulls,
				      "racerid" => $id,
				      "hasPrediction" => $#racerResults >= 0 && $racerResults[0]->{resultcurrentclass} eq $class ? 1 : 0,
      		                    };
	    }
	}
	@classResults = sort { $b->{hasPrediction} <=> $a->{hasPrediction} || ( ( $#{$a->{racerResults}} < 0 ? 999 : $a->{racerResults}->[0]->{realtime} ) 
				               <=> 
				 ( $#{$b->{racerResults}} < 0 ? 999 : $b->{racerResults}->[0]->{realtime} ) )
                                               ||
					       ( $a->{ racername } cmp $b->{ racername } ) } @classResults;
	push @results, { "class" => $class,
			 "racers" => 1 + $#classResults,
			 "classRecord" => $classRecords->{ $class }->{ $trackid } ? formatTime($classRecords->{ $class }->{ $trackid } ) : "",
			 "classResults" => \@classResults,
   	               };
    }

    if ( $ENV{SCRIPT_FILENAME} ) {
	my $frozen = freeze(\@results);
	my $dbhwrite = getDBConnection(1);
	$dbhwrite->do( "INSERT INTO cache ( cache_key, ts, value ) VALUES ( ?, NOW(), ? ) ON DUPLICATE KEY UPDATE ts = NOW(), value = ?", {}, $key, $frozen, $frozen );
    }

    if ( $race && $races{$race} ) {
	my @newresults;
	my %seen;
	foreach my $row ( @rows ) {
	    my $name       = $row->{name};
	    my $car        = $row->{car};
	    my $class      = $row->{class};
	    my $pca_race   = $row->{race};
	    my $number     = $row->{number};

	    next unless $pca_race eq $race;
	    next if $seen{$number}++;
	    next if !$name || !$class;

	    my ( $classresult ) = grep { $_->{class} eq $class } @results;

	    if ( !$classresult ) {
		print STDERR "unable to find class for $name and $class\n";
		next;
	    }
	    my ( $racer ) = grep { $_->{racername} eq $name } @{$classresult->{ classResults } };
	    if ( !$racer ) {
		print STDERR "unable to find result for $name and $class\n";
		next;
	    }

	    if ( $#{$racer->{racerResults}} >= 0 ) {
		$racer->{besttime} = $racer->{racerResults}->[0]->{resulttime};
		$racer->{resultdate} = $racer->{racerResults}->[0]->{resultdate};
		$racer->{resulturl} = $racer->{racerResults}->[0]->{resulturl};
	    }

	    push @newresults, $racer;
	}

	@newresults = sort { $b->{hasPrediction} <=> $a->{hasPrediction} || ( ( $#{$a->{racerResults}} < 0 ? 999 : $a->{racerResults}->[0]->{realtime} ) 
				               <=> 
				 ( $#{$b->{racerResults}} < 0 ? 999 : $b->{racerResults}->[0]->{realtime} ) )
                                               ||
					       ( $a->{ racername } cmp $b->{ racername } ) } @newresults;

	@results = @newresults;

	# print STDERR Dumper( \@results );
    }

    return ( \@results, \@races );
}

sub getTracks {
    my $dbh = shift;

    my $tracks = $dbh->selectall_arrayref( "select C.clubreg_id, C.date, T.name from clubreg_urls C, track T where C.track_id = T.track_id AND C.end_date >= CURDATE() AND IFNULL(C.cancelled, 0) != 1 order by C.date, T.name", { Slice => {} } );

    my @ids = map { $_->{clubreg_id} } @$tracks;
    my %values = map { $_->{clubreg_id} => $_->{name} } @$tracks;

    return ( \@ids, \%values );
}

sub getBestTimes {
    my $dbh = shift;
    my $trackid = shift;
    my $name = shift;
    my $class = shift;
    my $classRecords = shift;
    my $id = shift;

    my $times = $dbh->selectall_arrayref( "CALL get_driver_best_lap_times( ?, ? )", {}, $id, $trackid );

    my @classmatches = grep { ($_->[5] || "") eq $class } @$times;

    if ( $#classmatches >= 0 ) {
	$times = [ $classmatches[0] ];

	if ( 1 ) {
	    my $predictions = getLapTimePrediction( DBH     => $dbh, 
						    TRACKID => $trackid,
						    RACERID => $id,
						    NAME    => $name,
						    CLASS   => $class,
						    RECORDS => $classRecords,
						    IN_CLASS_PREFERRED => 1,
						    DELTA_PERCENTAGE => 4,
 		                                  );

	    if ( $#$predictions >= 0 ) {
		my $prediction = sum( map { $_->{prediction} } @$predictions ) / ( 1 + $#$predictions );
		
		if ( $prediction && $prediction < $times->[0]->[2] ) {
		    unshift @$times, [ $name, $class, $prediction, "", "", $class ];
		}
	    }
	}
    }
    else {
	my ( $count ) = $dbh->selectrow_array( "select count(*) from results where racer_id = ? and coracer_id = 0", {}, $id );

	if ( $count ) {
	    my $predictions = getLapTimePrediction( DBH     => $dbh, 
						    TRACKID => $trackid,
						    NAME    => $name,
						    RACERID => $id,
						    CLASS   => $class,
						    RECORDS => $classRecords,
						    IN_CLASS_PREFERRED => 1,
 		                                  );

	    if ( $#$predictions >= 0 ) {
		my $prediction = sum( map { $_->{prediction} } @$predictions ) / ( 1 + $#$predictions );
		my @results = sort { $a->[2] <=> $b->[2] } @$times;
		unshift @results, [ $name, $class, $prediction, "", "", $class ];
		$times = \@results;
	    }
	}
    }

    foreach my $i ( @$times ) {
	$i->[4] = myLapsURL( $i->[4] ) if $i->[4];
	# $i->[4] = "https://speedhive.mylaps.com/Sessions/$i->[4]" if $i->[4];
	$i->[6] = 0;
    }

    return $times;
}


sub getParticipants {
    my $id = shift;
    my $DEBUG = 1;

    my $dbh = getDBConnection( 1 );
    my $upcomingEvents = $dbh->selectall_arrayref( "SELECT * FROM clubreg_urls WHERE end_date >= CURDATE() AND registration <= CURDATE() AND (last_check_time IS NULL OR last_check_time < DATE_ADD(NOW(), INTERVAL -1 HOUR )) AND IFNULL(cancelled, 0) != 1", {Slice => {} } );

    foreach my $i ( @$upcomingEvents ) {
	next if $id && $id != $i->{clubreg_id};
	my $event = RennPoints::ClubRegistration::Event->new( id => $id, debug => $DEBUG );
	my $participants = eval { $event->participants };
	if ( $@ ) {
	    print STDERR "ERROR: $@\n";
	}

	if ( defined($participants) && @$participants ) {
	    $dbh->begin_work;
	    $dbh->do( "DELETE FROM clubreg_roster_raw WHERE clubreg_id = ?", {}, $id );
	    foreach my $participant ( @$participants ) {
		$dbh->do( "INSERT INTO clubreg_roster_raw ( clubreg_id, name, number, race, car, class ) VALUES ( ?, ?, ?, ?, ?, ? )",
			  {}, $id, $participant->{name}, $participant->{number}, $participant->{race}, $participant->{car}, $participant->{class} );
	    }
	    $dbh->do( "UPDATE clubreg_urls SET last_check_time = NOW() WHERE clubreg_id = ?", {}, $id );
	    $dbh->commit;
	}

    }

    my $racers = $dbh->selectall_arrayref( "SELECT name, number, race, car, class FROM clubreg_roster_raw WHERE clubreg_id = ?", {Slice => {}}, $id );
    return @$racers;
}
