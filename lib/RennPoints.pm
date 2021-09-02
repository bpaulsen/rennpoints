package RennPoints;

use strict;
use warnings;

use base qw( Exporter );
use RennPoints::DBI qw(getDBConnection);
use Lingua::EN::NameParse;
use List::Util qw( sum );

our @EXPORT_OK = qw( formatTime getDetailedClassRecords getAllClassRecords getLapTimePrediction getPredictionOfPrediction getAllTracks getTracks getClasses insertRacerIntoDB hasCodriver populateRacerIdsForEvent populateRacerIdsForEventUsingRegion searchForRacer getRecentEvents myLapsURL );

sub formatTime {
    my $time = shift;

    my $minute = int($time/60);
    return sprintf( "%1.3f", $time ) if !$minute;

    $time = $time - $minute * 60;
    return sprintf( "%d:%06.3f", $minute, $time );
}

sub getDetailedClassRecords {
    my %ARGS = @_;
    my $dbh     = $ARGS{DBH};
    my $trackid = $ARGS{TRACKID} || 0;
    my $class   = $ARGS{CLASS}   || "";
    my $session = $ARGS{SESSION} || 0;

    my $query = "CALL get_detailed_class_records(?, ?, ?)";
    my $data = $dbh->selectall_arrayref( $query, { Slice => {}}, $trackid, $session, $class );
    foreach my $i ( @$data ) {
	$i->{ laptime } = formatTime( $i->{ rawtime } );
    }

    return $data;
}

sub getClassRecords {
    my %ARGS = @_;
    my $dbh     = $ARGS{DBH};
    my $trackid = $ARGS{TRACKID} || 0;
    my $class   = $ARGS{CLASS}   || "";

    my $query = <<"EOF";
select R1.track_id, S1.current_class, min(S1.best_lap_time) as 'best_time'
from race R1, results S1
where R1.race_id = S1.race_id
and S1.best_lap_time > 40
and S1.current_class not like '%EX'
and S1.current_class not like 'GT4CS%'
and S1.current_class not like 'V%4%'
and char_length(S1.current_class) > 0
and S1.class_record_eligible = 1
and R1.track_id != 56
and ( ? = 0 OR R1.track_id = ? )
and ( ? = '' OR S1.current_class = ? )
and S1.status != 3
group by R1.track_id, S1.current_class
EOF

    my $data = $dbh->selectall_arrayref( $query, {}, $trackid, $trackid, $class, $class );
    my @results = map { { class   => $_->[1],
			  rawtime => $_->[2],
			  trackid => $_->[0],
	} } @$data;

    @results = grep { $_->{class} && $_->{rawtime} } @results;

    return \@results;
}

sub getAllClassRecords {
    my $dbh = shift;

    my $records = getClassRecords( DBH => $dbh );

    my %classRecords;
    foreach my $i ( @$records ) {
	$classRecords{ $i->{class} }->{ $i->{trackid} } = $i->{rawtime};
    }
    
    return \%classRecords;
}

sub getUserSprintRaces {
    my %ARGS    = @_;
    my $dbh     = $ARGS{DBH};
    my $racerid = $ARGS{RACERID};
    my $class   = $ARGS{CLASS}   || "";
    my $includeEnduro = $ARGS{INCLUDE_ENDURO} || 0;

    my $classquery = $class ? "S.current_class = ?" : "? = ''";

    my $query = <<"EOF";
select R.race_id, S.best_lap_time, R.track_id, t.short_name, S.current_class, S.full_name
from results S, race R, track t
where S.coracer_id = 0
and S.racer_id = ?
and S.race_id = R.race_id
-- and R.session_type = 3
and ( ? = 1 OR R.session_type != 4 )
and S.status != 3
and S.current_class is not null
and S.current_class not like "%EX"
and S.current_class not like "GT4CS%"
and S.current_class not like "V%4%"
and S.class_record_eligible = 1
and $classquery
and R.track_id = t.track_id
and S.best_lap_time > 40
EOF

    my $racerResults = $dbh->selectall_hashref( $query, "race_id", {}, $racerid, $includeEnduro, $class );

    if ( 0 && $class && scalar( keys %$racerResults ) == 0 ) {
	$racerResults = getUserSprintRaces( DBH  => $dbh,
					    RACERID => $racerid,
					    INCLUDE_ENDURO => $includeEnduro,
	                                  );
    }

    return $racerResults;
}

sub getPredictionOfPrediction {
    my %ARGS = @_;
    
    my $dbh          = $ARGS{DBH} || getDBConnection();
    my $trackid      = $ARGS{TRACKID};
    my $class        = $ARGS{CLASS};
    my $racerid      = $ARGS{RACERID};
    my $classRecords = $ARGS{RECORDS} || getAllClassRecords( $dbh );
    my $minPercentage = $ARGS{MIN_PERCENTAGE} || 0.8;
    my $deltaPercentage = ( defined( $ARGS{DELTA_PERCENTAGE} ) ? $ARGS{DELTA_PERCENTAGE} : 1 ) / 100;
    my $in_class_preferred = $ARGS{IN_CLASS_PREFERRED} || 0;
    my $DEBUG = $ARGS{DEBUG} || 0;

    # print STDERR "getPredictionOfPrediction: $trackid $class $racerid\n";

    my $query = <<"EOF";
select r2.full_name, r2.racer_id, r1.current_class, r1.best_lap_time as 'racer_best_lap_time',
       r2.best_lap_time AS 'competitor_best_time', r.track_id, t.short_name, r.date, r.mylaps_url
from results r1, results r2, race r, track t
where r1.racer_id = ? and r1.coracer_id = 0
and r1.race_id = r2.race_id
and r2.racer_id != ? and r2.coracer_id = 0
and r1.current_class = r2.current_class
and r1.best_lap_time > 40
and r2.best_lap_time > 40
and r1.race_id = r.race_id
and r.track_id = ?
and r.track_id = t.track_id
and r1.status != 3
and r2.status != 3
and exists( select 1 from results r3 where r2.racer_id = r3.racer_id and r3.coracer_id = 0
            and r3.current_class = ? )
EOF

my $results = $dbh->selectall_arrayref( $query, { Slice => {} }, $racerid, $racerid, $trackid, $class );
    
    my %predictions;
    foreach my $i ( @$results ) {
	if ( !$predictions{ $i->{racer_id } } ) {
	    my $tmp = getLapTimePrediction( TRACKID => $trackid,
					    RACERID => $i->{racer_id},
					    CLASS => $class,
					    RECORDS => $classRecords,
					    MIN_PERCENTAGE => .7,
					    IN_CLASS_PREFERRED => 1,
					    GET_PREDICTION_OF_PREDICTION => 0,
					    DELTA_PERCENTAGE => $deltaPercentage * 100,
		);
	    next if ( $#$tmp < 0 );
	    $predictions{ $i->{racer_id } } = sum( map { $_->{prediction} } @$tmp ) / ( 1 + $#$tmp );
	}
	$i->{ competitor_track_time } = $predictions{ $i->{ racer_id } };
	$i->{ prediction } = $i->{ racer_best_lap_time } / $i->{ competitor_best_time } * $i->{ competitor_track_time };
	
	# $i->{class_record} is the class record of the competitor at the track of comparison
	$i->{ class_record }        = $classRecords->{$i->{current_class}}->{$i->{track_id}};
	
	# $i->{ racer_class_record} is the class record of the racer at the track of comparison
	$i->{ racer_class_record }  = $classRecords->{$i->{current_class}}->{$i->{track_id}};
	
	# $i->{ track_competitor_record} is the class record of the competitor at the track of prediction
	$i->{ track_competitor_record }  = $classRecords->{$i->{current_class}}->{$trackid};
	
	$i->{ competitor_track_percentage }    = 1;
	$i->{ competitor_percentage }          = $i->{competitor_best_time} && $i->{class_record} ? $i->{class_record} / $i->{competitor_best_time} : 0;
	$i->{ racer_percentage }               = $i->{racer_class_record} / $i->{ racer_best_lap_time };
	
	$i->{ class_record_pct_diff } = 1;
	
	$i->{ combined_percentage } = $i->{ competitor_track_percentage } * $i->{ competitor_percentage } * $i->{ racer_percentage } * $i->{ class_record_pct_diff };
    }

    my %seen;
    
    my @competitors = grep { $_->{ combined_percentage } && $_->{combined_percentage} >= .9 } @$results;
    my @predictions = sort { $b->{ combined_percentage } <=> $a->{ combined_percentage } } @competitors;
    @predictions = grep { !$seen{$_->{racer_id}}++ } @predictions;

    return \@predictions;
}

sub getLapTimePrediction {
    my %ARGS = @_;
    
    my $dbh          = $ARGS{DBH} || getDBConnection();
    my $trackid      = $ARGS{TRACKID};
    my $class        = $ARGS{CLASS};
    my $racerid      = $ARGS{RACERID};
    my $classRecords = $ARGS{RECORDS} || getAllClassRecords( $dbh );
    my $minPercentage = $ARGS{MIN_PERCENTAGE} || 0.8;
    my $deltaPercentage = ( defined( $ARGS{DELTA_PERCENTAGE} ) ? $ARGS{DELTA_PERCENTAGE} : 1 ) / 100;
    my $in_class_preferred = $ARGS{IN_CLASS_PREFERRED} || 0;
    my $getpredictionofprediction = defined( $ARGS{GET_PREDICTION_OF_PREDICTION} ) ? $ARGS{GET_PREDICTION_OF_PREDICTION} : 1;
    my $DEBUG = $ARGS{DEBUG} || 0;

    my $query = <<"EOF";
select s3.full_name, X.best_lap_time as 'competitor_track_time', X.current_class, s3.race_id, s3.best_lap_time AS 'competitor_best_time', 
       s3.racer_id, s4.best_lap_time as 'racer_best_lap_time', R.track_id, t.short_name,
       s4.best_lap_time / s3.best_lap_time * X.best_lap_time as 'prediction',
       R.date, R.mylaps_url
  from results s3, results s4, race R, track t,
    ( select s2.racer_id, s2.current_class, min(s2.best_lap_time) as 'best_lap_time'
      from results s2, race r2
      where s2.race_id = r2.race_id
      and r2.track_id = ?
      and s2.racer_id != ?
      and s2.best_lap_time > 40
      and s2.status != 3
      and s2.coracer_id = 0
      and s2.class_record_eligible = 1
      and s2.current_class not like '%EX'
      and s2.current_class not like 'GT4CS%'
      and s2.current_class not like 'V%4%'
      group by s2.racer_id, s2.current_class
    ) as X
where X.current_class = s3.current_class
and X.racer_id = s3.racer_id
AND s3.coracer_id = 0
and s3.class_record_eligible = 1
and s3.status != 3
and s3.best_lap_time > 40
and s3.race_id = s4.race_id
and s4.coracer_id = 0
and s4.racer_id = ?
and s4.race_id = R.race_id
and s4.status != 3
and s4.current_class is not null
and s4.current_class not like "%EX"
and s4.current_class not like "GT4CS%"
and s4.current_class not like "V%4%"
and s4.class_record_eligible = 1
and s4.current_class = ?
and R.track_id = t.track_id
and s4.best_lap_time > 40
and R.track_id != ?
EOF

    my $tmp = $dbh->selectall_arrayref( $query, { Slice => {} }, $trackid, $racerid, $racerid, $class, $trackid );
    my @competitors = @$tmp;

    if ( $#competitors < 0 && $getpredictionofprediction ) {
	return getPredictionOfPrediction( %ARGS,
					  RECORDS => $classRecords,
					  DBH => $dbh,
	    );
    }

    foreach my $i ( @competitors ) {
	my $current_track_id = $i->{track_id};

	# $i->{class_record} is the class record of the competitor at the track of comparison
	$i->{ class_record }        = $classRecords->{$i->{current_class}}->{$i->{track_id}};

	# $i->{ racer_class_record} is the class record of the racer at the track of comparison
	$i->{ racer_class_record }  = $classRecords->{$class}->{$i->{track_id}};

	# $i->{ track_competitor_record} is the class record of the competitor at the track of prediction
	$i->{ track_competitor_record }  = $classRecords->{$i->{current_class}}->{$trackid};

	$i->{ competitor_track_percentage }    = $i->{track_competitor_record} ? $i->{track_competitor_record} / $i->{competitor_track_time } : 0;
	$i->{ competitor_percentage }          = $i->{competitor_best_time} && $i->{class_record} ? $i->{class_record} / $i->{competitor_best_time} : 0;
	$i->{ racer_percentage }               = $i->{racer_class_record} / $i->{ racer_best_lap_time };

	$i->{ class_record_pct_diff } = $i->{ racer_class_record } ? 1 - abs( $i->{ racer_class_record } - $i->{ class_record } ) / $i->{ racer_class_record } : 1;

	$i->{ combined_percentage } = $i->{ competitor_track_percentage } * $i->{ competitor_percentage } * $i->{ racer_percentage } * $i->{ class_record_pct_diff };
    }

    @competitors = grep { $_->{combined_percentage} >= $minPercentage } @competitors;

    my @predictions = sort { $b->{ combined_percentage } <=> $a->{ combined_percentage } } @competitors;

    if ( $in_class_preferred ) {
	my @relevant = grep { $_->{current_class} eq $class } @predictions;
	if ( $#relevant >= 0 ) {
	    @predictions = @relevant;
	}
    }
    
    @predictions = grep { $_->{combined_percentage} >= $predictions[0]->{combined_percentage} - $deltaPercentage && $_->{prediction} > 0 } @predictions;

    return \@predictions;
}

sub getRecentEvents {
    my $dbh = shift || getDBConnection();

    my $events = $dbh->selectall_arrayref( "SELECT E.event_id, E.description, E.date, ( SELECT COUNT(*) FROM race R WHERE E.event_id = R.event_id ) AS 'races' FROM event E ORDER BY E.date DESC LIMIT 0,30", { Slice => {} } );

    my @list;
    foreach my $i ( @$events ) {
	push @list, { $i->{event_id} => "$i->{date} : $i->{description} ($i->{races} races)" }
    }

    return \@list;
}

sub getAllTracks {
    my $dbh = shift || getDBConnection();

    my $data = $dbh->selectall_arrayref( "select distinct t.track_id, t.name from track t" );
    my %tracks = map { $_->[0] => $_->[1] } @$data;
    return %tracks;
}

sub getTracks {
    my $dbh = shift || getDBConnection();

    my $data = $dbh->selectall_arrayref( "select distinct t.track_id, t.name from track t, race r where t.track_id = r.track_id and r.date > '20070101'" );
    my %tracks = map { $_->[0] => $_->[1] } @$data;
    return %tracks;
}

sub getClasses {
    my $dbh = shift || getDBConnection();

    my $classes = $dbh->selectall_arrayref( "select distinct e.current_class from results e, race r where e.current_class not like '%EX' AND e.current_class NOT LIKE 'GT4CS%' and e.race_id = r.race_id and r.session_type in ( 3,4,5 ) and status = 1 and r.date >= '20070101' order by length(current_class), current_class" );
    my @classes = map { $_->[0] } @$classes;
    return @classes;
}

sub insertRacerIntoDB {
    my $dbh = shift;
    my $racer = shift;
    my $forceparse = shift || 0;

    my ( $id, $surname, $givenname ) = $dbh->selectrow_array( "SELECT racer_id, surname, givenname FROM racer WHERE clubreg_name = ?", {}, $racer );

    if ( !$givenname || $forceparse ) {
	my $name = Lingua::EN::NameParse->new( allow_reversed => 1 );

	my $parsed = 1;
	if ( $name->parse( $racer ) ) { # returns 1 if an error
	    my $tmpracer = $racer;
	    $tmpracer =~ s/,\s*jr\.?\s*,/,/ix;
	    if ( $name->parse( $tmpracer ) ) {
		$tmpracer =~ s/,\s*\w\./,/x;
		if ( $name->parse( $tmpracer ) ) {
		    $parsed = 0;
		    ( $surname ) = $racer =~ /^([\w\']+)[\s\,]/x;
		    ( $surname ) = $racer =~ /([\w\']+)[\s\,]/x if !$surname;
		}
	    }
	}

	if ($parsed) {
	    my %components = $name->components;

	    $surname = $components{surname_1};
	    $givenname = $components{given_name_1} || $components{middle_name} || $components{initials_1};
	}

	my $tmpid = $id || "";
	$surname ||= "";
	$givenname ||= "";
	print STDERR "'$racer' '$tmpid' '$surname' '$givenname'\n";
	if ( $id ) {
	    $dbh->do( "UPDATE racer SET surname = ?, givenname = ? WHERE racer_id = ?", {}, $surname, $givenname, $id );
	}
    }

    if ( !$id ) {
	print STDERR "Inserting $racer\n";
	$dbh->do( "INSERT racer ( clubreg_name, surname, givenname ) VALUES ( ?, ?, ? )", {}, $racer, $surname, $givenname );
	( $id ) = $dbh->selectrow_array( "SELECT racer_id FROM racer WHERE clubreg_name = ?", {}, $racer );
    }

    if ( 0 ) {
	my $names = $dbh->selectall_arrayref( "SELECT DISTINCT(full_name) AS 'full_name' FROM results R WHERE UPPER(full_name) LIKE \"% $surname\%\" AND NOT EXISTS(SELECT 1 FROM racer_names N WHERE N.full_name = R.full_name AND N.racer_id = ? ) ORDER BY 1", {}, $id );
	foreach my $j ( @$names ) {
	    my $codriver = 0;
	    $codriver = 1 if $j->[0] =~ m{/}x;
	    $codriver = 1 if $j->[0] =~ m{\\}x;
	    $dbh->do( "INSERT racer_names ( racer_id, full_name, codriver ) VALUES ( ?, ?, ? )", {}, $id, $j->[0], $codriver );
	}
    }

    return $id;
}

sub hasCodriver {
    my $name = shift;
    my $codriver = 0;
	
    return 1 if $name =~ m{/}x;
    return 1 if $name =~ m{\\}x;

    $name =~ s/\s+(?:jr|sr|ii|iii|iv)\s*$//ix;
    return 1 if $name =~ m/\s*[\w\.\,]+\s+[\w]{2,}\s+[\w\.\,]+\s+[\w]{2,}/x;
    return 1 if $name =~ m/\s*[\w\.\,]+\s+[\w\.]{3,}\s+[\w\.\,]+\s+[\w\.]{3,}/x;
    return 1 if $name =~ m/\s*[\w\.\,]+\s+[\w\,]{3,}\s+[\w\.\,]+\s+[\w\,]{3,}/x;
    return 1 if $name =~ m/\s*[\w\.\,]+\s+[\w\.\,]{4,}\s+[\w\.\,]+\s+[\w\.\,]{4,}/x;

    return 0;
}

sub populateRacerIdsForEventUsingRegion {
    my $dbh = shift;
    my $eventid = shift;

    # my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name, IFNULL(S.transponder,0) AS 'transponder' FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND ( S.racer_id IS NULL OR S.coracer_id IS NULL )", { Slice => {} }, $eventid );
    my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name, RR.racer_id FROM results S, race R, racer_regions RR WHERE S.race_id = R.race_id AND R.event_id = ? AND S.racer_id IS NULL AND S.driver_region IS NOT NULL AND S.first_name = RR.first_name AND S.last_name = RR.last_name AND RR.racer_id > 0 AND RR.year = YEAR(R.date) AND ( S.driver_region = RR.region OR S.driver_region = 'UPC' AND RR.region = 'UCR' )", { Slice => {} }, $eventid );

    foreach my $i ( @$racers ) {
	$dbh->do( "UPDATE results SET racer_id = ?, coracer_id=0 WHERE full_name = ? AND race_id IN ( SELECT race_id FROM race WHERE event_id = ? ) AND racer_id IS NULL", {}, $i->{racer_id}, $i->{full_name}, $eventid );
    }

    $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND ( S.racer_id IS NULL OR S.coracer_id IS NULL )", { Slice => {} }, $eventid );

    foreach my $i ( @$racers ) {
	my $racerid;
	my $coracerid;
	
	$i->{ codriver } = hasCodriver( $i->{full_name} );
	# $coracerid = 0 if !$i->{ codriver };
	
	my $matches = $dbh->selectall_arrayref( "SELECT DISTINCT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.codriver = 0 AND race_id = ?", { Slice => {} }, $i->{full_name}, $eventid );

	if ( $#$matches == -1 ) {
	    $matches = $dbh->selectall_arrayref( "SELECT DISTINCT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.codriver = 0 AND race_id = 0", { Slice => {} }, $i->{full_name} );
	}

	if ( $#$matches == 0 ) {
	    $racerid = $matches->[0]->{ racer_id };
	}

	if ( !$i->{ codriver } ) {
	    $coracerid = 0;
	}
	else {
	    my $matches = $dbh->selectall_arrayref( "SELECT DISTINCT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.codriver = 1 AND race_id = ?", { Slice => {} }, $i->{full_name}, $eventid );

	    if ( $#$matches == -1 ) {
		$matches = $dbh->selectall_arrayref( "SELECT DISTINCT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.codriver = 1 AND race_id = 0", { Slice => {} }, $i->{full_name} );
	    }

	    if ( $#$matches == 0 ) {
		$coracerid = $matches->[0]->{ racer_id };
	    }
	}

	if ( defined( $racerid ) || defined( $coracerid ) ) {
	    $dbh->do( "UPDATE results SET racer_id = ?, coracer_id = ? WHERE full_name = ? AND race_id IN ( SELECT race_id FROM race WHERE event_id = ? ) AND ( racer_id IS NULL OR coracer_id IS NULL )", {}, $racerid, $coracerid, $i->{full_name}, $eventid );
	}
    }

    return;
}

sub populateRacerIdsForEvent {
    my $dbh = shift;
    my $eventid = shift;

    my $racers = $dbh->selectall_arrayref( "SELECT DISTINCT S.full_name, IFNULL(S.transponder,0) AS 'transponder' FROM results S, race R WHERE R.race_id = S.race_id AND R.event_id = ? AND ( S.racer_id IS NULL OR S.coracer_id IS NULL )", { Slice => {} }, $eventid );

    foreach my $i ( @$racers ) {
	my $racerid;
	my $coracerid;
	
	$i->{ codriver } = hasCodriver( $i->{full_name} );
	# $coracerid = 0 if !$i->{ codriver };
	
	my $matches = $dbh->selectall_arrayref( "SELECT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.transponder = ? AND R.codriver = 0 AND race_id = ?", { Slice => {} }, $i->{full_name}, $i->{transponder}, $eventid );

	if ( $#$matches == -1 ) {
	    $matches = $dbh->selectall_arrayref( "SELECT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.transponder = ? AND R.codriver = 0 AND race_id = ?", { Slice => {} }, $i->{full_name}, $i->{transponder}, 0 );
	}

	if ( $#$matches == 0 ) {
	    $racerid = $matches->[0]->{ racer_id };
	}

	if ( !$i->{ codriver } ) {
	    $coracerid = 0;
	}
	else {
	    my $matches = $dbh->selectall_arrayref( "SELECT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.transponder = ? AND R.codriver = 1 AND race_id = ?", { Slice => {} }, $i->{full_name}, $i->{transponder}, $eventid );

	    if ( $#$matches == -1 ) {
		$matches = $dbh->selectall_arrayref( "SELECT racer_id FROM racer_keys R WHERE R.full_name = ? AND R.transponder = ? AND R.codriver = 1 AND race_id = ?", { Slice => {} }, $i->{full_name}, $i->{transponder}, 0 );
	    }

	    if ( $#$matches == 0 ) {
		$coracerid = $matches->[0]->{ racer_id };
	    }
	}

	if ( defined( $racerid ) || defined( $coracerid ) ) {
	    $dbh->do( "UPDATE results SET racer_id = ?, coracer_id = ? WHERE full_name = ? AND IFNULL(transponder,0) = ? AND race_id IN ( SELECT race_id FROM race WHERE event_id = ? ) AND ( racer_id IS NULL OR coracer_id IS NULL )", {}, $racerid, $coracerid, $i->{full_name}, $i->{transponder}, $eventid );
	}
    }

    return;
}

sub searchForRacer {
    my %ARGS = @_;

    my $dbh = $ARGS{DBH} || getDBConnection();
    my $search = $ARGS{SEARCH} || "";

    my $string;
    foreach my $i ( split " ", $search ) {
	$string .= "+$i* " if $i;
    }

    my $data = $dbh->selectall_arrayref( "CALL driver_lookup_search(?)", { Slice => {} }, $string );

    if ( !$data || $#$data < 0 ) {
	$data = $dbh->selectall_arrayref( "SELECT racer_id, CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END AS 'fullname', clubreg_name, MATCH(clubreg_name) AGAINST (? IN BOOLEAN MODE) AS relevance FROM racer WHERE MATCH(clubreg_name) AGAINST (? IN BOOLEAN MODE) AND ( givenname IS NOT NULL OR surname IS NOT NULL ) ORDER BY 4 DESC", { Slice => {} }, $string, $string );
    }

    if ( !$data || $#$data < 0 ) {
	$string = "";
	foreach my $i ( split " ", $search ) {
	    $string .= "+$i ";
	}

	$data = $dbh->selectall_arrayref( "SELECT racer_id, CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END AS 'fullname', clubreg_name, MATCH(clubreg_name) AGAINST (? IN BOOLEAN MODE) AS relevance FROM racer WHERE MATCH(clubreg_name) AGAINST (? IN BOOLEAN MODE) AND ( givenname IS NOT NULL OR surname IS NOT NULL ) ORDER BY 4 DESC", { Slice => {} }, $string, $string );
    }

    if ( !$data || $#$data < 0 ) {
	$data = $dbh->selectall_arrayref( "SELECT racer_id, CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END AS 'fullname', clubreg_name, MATCH(clubreg_name) AGAINST (?) AS relevance FROM racer WHERE MATCH(clubreg_name) AGAINST (?) AND ( givenname IS NOT NULL OR surname IS NOT NULL ) ORDER BY 4 DESC", { Slice => {} }, $search, $search );
    }

    if ( !$data || $#$data < 0 ) {
	$data = $dbh->selectall_arrayref( "SELECT racer_id, CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END AS 'fullname', clubreg_name, 1 AS relevance FROM racer WHERE ? = CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END", { Slice => {} }, $search );
    }

    return $data;
}

sub myLapsURL {
    my $url = shift;

    my ( $mylaps ) = $url =~ /(\d+)$/xo;
    # $mylaps = "http://www.mylaps.com/en/classification/$mylaps";
    $mylaps = "https://speedhive.mylaps.com/Sessions/$mylaps";

    return $mylaps;
}

1;
