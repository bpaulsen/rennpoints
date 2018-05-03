#!/usr/bin/perl

use strict;
use warnings;

use base 'CGIBase';
use RennPoints qw( getClasses myLapsURL );
use List::Util qw( sum );
use Cache::File;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $dbh = $self->dbh();
    my @years = getYears( $self->dbh );

    my $year = $cgi->param( "year" ) || $years[0];
    my $region = $cgi->param( "region" ) || 0;
    my $zone = $cgi->param( "zone" ) || 0;
    my $class = $cgi->param("class");
    my $eligible = $cgi->param("eligible");
    my $ignorecache = $cgi->param("ignorecache");
    my $id = $cgi->param("id");
    my $racerclass = $cgi->param("racerclass");
    my $points = getPoints( $dbh, $class || "All Classes", $year, $region, $zone, $eligible, $ignorecache );

    my %templateParams = ( CLASSES => [ getClasses( $self->dbh ) ],
			   REGIONS => { getRegions( $self->dbh ) },
			   ZONES   => [ getZones( $self->dbh ) ],
			   YEARS   => \@years,
			   RESULTS => $points,
                           CLASS => $class,
                           YEAR => $year,
                           REGION => $region,
                           RACERCLASS => $racerclass,
                           ID => $id,
	                 );

    # fill in some parameters
    if ( $id ) {
	my @individualpoints = getIndividualPoints( $dbh, $racerclass, $id, $year, $region, $cgi->param( "sortby" ) || "date" );

	# fill in some parameters
	$templateParams{ INDIVIDUAL_RESULTS } = \@individualpoints;

	my ( $racer_name ) = $dbh->selectrow_array( "SELECT CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END FROM racer WHERE racer_id = ?", {}, $id );
	$templateParams{ RACER_NAME } = $racer_name;
    }

    return $self->tt_process('points.html',
			     \%templateParams,
	                    );
}

sub getYears {
    my $dbh = shift;

    my $years = $dbh->selectall_arrayref( "select distinct YEAR(e.date) from event e, race r where e.event_id = r.event_id and r.points_type_2 = 2 order by 1 DESC" );
    my @years = map { $_->[0] } @$years;
    return @years;
}

sub getRegions {
    my $dbh = shift;

    my $regions = $dbh->selectall_arrayref( "select region_id, name from regions" );
    my %regions = map { $_->[0] => $_->[1] } @$regions;
    return %regions;
}

sub getZones {
    my $dbh = shift;

    my $zones = $dbh->selectall_arrayref( "SELECT DISTINCT zone FROM zone_region_map" );
    my @zones = sort { $a <=> $b } ( map { $_->[0] } @$zones );
    return @zones;
}

sub getPoints {
    my $dbh = shift;
    my $class = shift;
    my $year = shift;
    my $region = shift || 0;
    my $zone = shift || 0;
    my $eligible = shift || 0;
    my $ignorecache = shift || 0;

    my $cache = Cache::File->new( cache_root => "/tmp/rennpoints",
				  lock_level => Cache::File::LOCK_LOCAL(),
				  );

    my $key = "NEWSYSTEM7.$year.$region";

    my $timestampKey = "Timestamp:$key";
    my ( $dbTimestamp ) = $dbh->selectrow_array( "SELECT lastUpdate FROM cacheTimestamp" );
    my $cacheTimestamp = $cache->thaw( $timestampKey );
    $cacheTimestamp = $$cacheTimestamp if $cacheTimestamp;
    if ( !$cacheTimestamp || $dbTimestamp gt $cacheTimestamp ) {
	$ignorecache = 1;
    }

    my $data;
    # $ignorecache = 1;
    if ($ignorecache || !$ENV{SCRIPT_FILENAME} || !($data = $cache->thaw($key) )) {
	warn "refreshing cache\n";
	$data = cacheResults( $cache, $key, $dbh, $year, $region );
	$cache->freeze( $timestampKey, \$dbTimestamp );
    }

    if ( $zone && $year >= 2012 ) {
	foreach my $class ( @$data ) {
	    my @classResults = grep { $_->{zone} == $zone } @{$class->{racers}};
	    $class->{racers} = \@classResults;
	}
    }

    if ( $eligible ) {
	foreach my $class ( @$data ) {
	    my @classResults = grep { $_->{eligible_for_championship} > 0 } @{$class->{racers}};
	    $class->{racers} = \@classResults;
	}
    }

    return $data;
}

sub cacheResults {
    my $cache = shift;
    my $key = shift;
    my $dbh = shift;
    my $year = shift;
    my $region = shift || 0;

    $region = 0 if $year >= 2012;

    my $query =<<"EOF";
SELECT r.racer_id,
       r.full_name,
       CEIL(CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN -1
            ELSE IFNULL( (SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1 OR r.status != 1             THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
					  ELSE                                                       0
                                     END
                                   )                
                     FROM   position_points p WHERE p.position_in_class = r.position_in_class), 0 )
            + CASE WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 OR r.status != 1 THEN 0
                   ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
              END
       END / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END ) AS 'points',
       a.event_id,
       e.event_type,
       r.class,
       r.status,
       (SELECT zone FROM racer_regions2 rr, zone_region_map z WHERE r.racer_id = rr.racer_id AND rr.region = z.region AND rr.year = ? ) AS 'zone',
       CASE WHEN a.points_type_2 = 1 THEN 0 ELSE 1 END AS 'points_eligible',
       (SELECT rr.region FROM racer_regions2 rr WHERE r.racer_id = rr.racer_id AND rr.year = ? ) AS 'region'
FROM   results r, race a, event e, track t
WHERE  r.race_id = a.race_id
AND    e.event_id = a.event_id
AND    e.track_id = t.track_id
AND    a.session_type in (3,4,5)
-- AND    status = 1
AND    class not like "%EX"
AND    class not like "GT4CS%"
AND    class not like "V%4%"
AND    class not like "V%6%"
AND    YEAR(a.date) = ?
AND    ( ? = 0 OR t.region_id = ? OR e.event_type = 3 )
AND    e.event_type > 0
AND    ( YEAR(a.date) < 2015 OR r.status IN (1,2) )
   UNION ALL
SELECT r.coracer_id AS 'racer_id',
       CONCAT_WS( ' ', r2.givenname, r2.surname )AS 'full_name',
       FLOOR(CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN -1
            ELSE IFNULL( (SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1 OR r.status != 1             THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
					  ELSE                                                       0
                                     END
                                   )                
                     FROM   position_points p WHERE p.position_in_class = r.position_in_class), 0 )
            + CASE WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 OR r.status != 1 THEN 0
                   ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
              END
       END / 2 ) AS 'points',
       a.event_id,
       e.event_type,
       r.class,
       r.status,
       (SELECT zone FROM racer_regions2 rr, zone_region_map z WHERE r.coracer_id = rr.racer_id AND rr.region = z.region AND rr.year = ? ) AS 'zone',
       CASE WHEN a.points_type_2 = 1 THEN 0 ELSE 1 END AS 'points_eligible',
       (SELECT rr.region FROM racer_regions2 rr WHERE r.coracer_id = rr.racer_id AND rr.year = ? ) AS 'region'
FROM   results r, race a, event e, track t, racer r2
WHERE  r.race_id = a.race_id
AND    e.event_id = a.event_id
AND    e.track_id = t.track_id
AND    a.session_type in (3,4,5)
AND    r.coracer_id = r2.racer_id
-- AND    status = 1
AND    class not like "%EX"
AND    class not like "GT4CS%"
AND    class not like "V%4%"
AND    r.coracer_id > 0
AND    a.date > '20120101'
AND    YEAR(a.date) = ?
AND    ( ? = 0 OR t.region_id = ? OR e.event_type = 3 )
AND    e.event_type > 0
AND    ( YEAR(a.date) < 2015 OR r.status IN (1,2) )
EOF

    my $results = $dbh->selectall_arrayref( $query, {}, $year, $year, $year, $region, $region, $year, $year, $year, $region, $region );

    my %points;
    my %names;
    my %zones;
    my %event;
    my %regionevent;
    my %seen;
    my %number_of_races;
    my %regions;
    foreach my $i ( @$results ) {
	my $dq = $i->[2] == -1 ? 1 : 0;
	$i->[2] = 0 if $dq;

	my ( $racerid, $name, $points, $eventid, $eventtype, $class, $status, $racerzone, $points_eligible, $racerregion ) = @$i;
	$racerzone ||= 0;
	$racerregion ||= "";

	push @{$points{$class}->{ $racerid } }, $points;
	$names{ $racerid }->{ $name }++ if $name !~ m{/}x;
	$zones{ $racerid } = $racerzone;
	$regions{ $racerid } = $racerregion;
	$number_of_races{$racerid}->{$class} += $points_eligible;
	if ( !defined($event{ $racerid }->{ $eventid }) || $event{ $racerid }->{ $eventid } == 1 ) {
	    $event{$class}->{ $racerid }->{ $eventid } = $dq ? -1 : 1;
	}

	if ( $eventtype == 1 || $eventtype == 2 ) {
	    if ( !defined($regionevent{$class}->{ $racerid }->{ $eventid }) || $regionevent{$class}->{ $racerid }->{ $eventid } == 1 ) {
		$regionevent{$class}->{ $racerid }->{ $eventid } = $dq ? -1 : 1;
	    }
	}

	$seen{ $racerid } = 1;
    }

    my %finalname;
    foreach my $i ( keys %names ) {
	foreach my $j ( keys %{$names{$i}} ) {
	    if ( !$finalname{ $i } ||  $names{ $i }->{ $j } > $names{$i}->{ $finalname{ $i } } ) {
		$finalname{ $i } = $j;
	    }
	}
    }

    if ( $region > 0 ) {
	foreach my $i ( keys %points ) {
	  foreach my $j ( keys %{$points{$i}} ) {
	    my @events = grep { $regionevent{$i}->{$j}->{$_} >= 0 } keys %{$regionevent{$i}->{$j}};
	    if ( $#events < 0 ) {
	      delete $points{$i}->{$j};
	    }
	  }
	}
    }

    my @totals;
    foreach my $i ( keys %points ) {
	foreach my $j ( keys %{$points{$i}} ) {
	    my @list = sort { $b <=> $a } @{$points{$i}->{$j}};
	    my $total = sum( @list );
	    my $listsize = $#list >= 7 ? 7 : $#list;
	    my $best = sum( @list[0..$listsize] );

	    my @events = grep { $event{$i}->{$j}->{$_} >= 0 } keys %{$event{$i}->{$j}};
	    my $eventpoints = 5 * ( 1 + $#events );
	    $eventpoints = 25 if ( $eventpoints > 25 );

	    push @totals, { "name" => $finalname{ $j }, 
			    "totalrace" => $total,
			    "best" => $best,
			    "eventpoints" => $eventpoints,
			    "total" => $eventpoints + $best,
			    "racerid" => $j,
			    "racerclass" => $i,
			    "zone" => $zones{$j},
			    "eligible_for_championship" => ( $year < 2013 ? 1
							     : $year == 2013 && $number_of_races{$j}->{$i} >= 6 ? 1
							     : $year >= 2014 && $number_of_races{$j}->{$i} >= 5 ? 1 
							     : 0 
							   ),
			    "region" => $regions{$j},
	    };
	}
    }

    my $thirteens = $dbh->selectall_hashref( "SELECT racer_id FROM thirteen WHERE racer_id > 0 AND year = ?", "racer_id", {}, $year );
    @totals = grep { !$thirteens->{ $_->{racerid} } } @totals;

    @totals = sort { length($a->{racerclass}) <=> length($b->{racerclass}) || $a->{"racerclass"} cmp $b->{"racerclass"} || $b->{"total"} <=> $a->{"total"} || $b->{ "best" } <=> $a->{ "best" } || $b->{ "totalrace" } <=> $a->{ "totalrace" } } @totals;

    my %classes;
    foreach my $i ( @totals ) {
	push @{$classes{ $i->{"racerclass"} }}, $i;
    }
   
    my @classresults;
    foreach my $i ( sort { length($a) <=> length($b) || $a cmp $b } keys %classes ) {
	push @classresults, { racerclass => $i, racers => $classes{$i} };
    }
  
  if ( $ENV{SCRIPT_FILENAME} ) {
      $cache->freeze( $key, \@classresults );
  }

    return \@classresults;
}

sub getIndividualPoints {
    my $dbh = shift;
    my $class = shift;
    my $racerid = shift;
    my $year = shift;
    my $region = shift || 0;
    my $sortby = shift || "date";

    my $query =<<"EOF";
SELECT r.full_name,
       CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id
                          AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            ELSE IFNULL( ( SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1                              THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
                                          ELSE                                                       0
                                     END
                                   )                
                           FROM position_points p WHERE p.position_in_class = r.position_in_class ), 0 )
       END / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END AS 'positionpoints',
       t.short_name,
       a.description,
       r.position_in_class,
       r.status,
       a.points_type_2,
       ty.description,
       CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id
                          AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 THEN 0
            ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
       END / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END AS 'bonuspoints',
       DATE(a.date),
       a.mylaps_url,
       CEIL( ( CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id
                                  AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            ELSE IFNULL( ( SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1                              THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
                                          ELSE                                                       0
                                     END
                                   )                
                           FROM position_points p WHERE p.position_in_class = r.position_in_class ), 0 )
          END 
           +
          CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id 
                             AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 THEN 0
            ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
          END
       ) / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END ) AS 'points'
FROM   results r, race a, event e, track t, event_types ty
WHERE  t.track_id = e.track_id 
AND    r.race_id = a.race_id 
AND    e.event_type = ty.event_type
AND    a.session_type in (3,4,5) 
and    e.event_id = a.event_id 
and    class = ? 
and    r.racer_id = ?
AND    YEAR(a.date) = ?
AND    ( t.region_id = ? OR e.event_type = 3 OR ? = 0 )
  UNION ALL
SELECT r.full_name,
       CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id
                 AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            ELSE IFNULL( ( SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1                              THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
                                          ELSE                                                       0
                                     END
                                   )                
                           FROM position_points p WHERE p.position_in_class = r.position_in_class ), 0 )
       END / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END AS 'positionpoints',
       t.short_name,
       a.description,
       r.position_in_class,
       r.status,
       a.points_type_2,
       ty.description,
       CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id AND r2.status = 3 AND a2.session_type IN (3,4,5,6) ) THEN 0
            WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 THEN 0
            ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
       END / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END AS 'bonuspoints',
       DATE(a.date),
       a.mylaps_url,
       FLOOR( ( CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id AND r2.status = 3 AND a2.session_type IN (3,4,5) ) THEN 0
            ELSE IFNULL( ( SELECT CEILING(p.points
                                  *  CASE WHEN a.points_type_2 = 1                              THEN 0
                                          WHEN a.points_type_2 = 2 AND e.event_type IN ( 1, 2 ) THEN 1
                                          WHEN a.points_type_2 = 2 AND e.event_type = 3         THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type IN ( 1, 2 ) THEN 1.5
                                          WHEN a.points_type_2 = 3 AND e.event_type = 3         THEN 2
                                          ELSE                                                       0
                                     END
                                   )                
                           FROM position_points p WHERE p.position_in_class = r.position_in_class ), 0 )
          END 
           +
          CASE WHEN EXISTS ( SELECT 1 FROM results r2, race a2 WHERE r2.race_id = a2.race_id AND a2.event_id = a.event_id AND r.class=r2.class AND r.racer_id = r2.racer_id AND r2.status = 3 AND a2.session_type IN (3,4,5,6) ) THEN 0
            WHEN a.points_type_2 = 1 OR a.points_type_2 = 4 THEN 0
            ELSE LEAST( 10, ( SELECT COUNT(*) FROM results r2 WHERE r.race_id = r2.race_id AND r.class = r2.class AND r2.status = 1 AND r2.position_in_class > r.position_in_class ) )
          END
       ) / CASE WHEN a.date > '20120101' AND r.coracer_id > 0 THEN 2 ELSE 1 END ) AS 'points'
FROM   results r, race a, event e, track t, event_types ty
WHERE  t.track_id = e.track_id 
AND    r.race_id = a.race_id 
AND    e.event_type = ty.event_type
AND    a.session_type in (3,4,5) 
and    e.event_id = a.event_id 
and    class = ? 
and    r.coracer_id = ?
AND    a.date > '20120101'
AND    YEAR(a.date) = ?
AND    ( t.region_id = ? OR e.event_type = 3 OR ? = 0 )
EOF

#    print $query, "\n";

    my $results = $dbh->selectall_arrayref( $query, {}, $class, $racerid, $year, $region, $region, $class, $racerid, $year, $region, $region );

    my @totals;
    foreach my $i ( @$results ) {
	my $position = $i->[4];
	if ( $i->[5] == 2 ) {
	    $position = "DNF";
	    $i->[1] = 0;
	    $i->[8] = 0;
	    $i->[11] = 0;
	}
	if ( $i->[5] == 3 ) {
	    $position = "DQ";
	    $i->[1] = 0;
	    $i->[8] = 0;
	    $i->[11] = 0;
	}
	if ( $i->[5] == 4 ) {
	    $position = "DQ*";
	    $i->[1] = 0;
	    $i->[8] = 0;
	    $i->[11] = 0;
	}

	$i->[7] =~ s/\sEvent//x;

	if ( $i->[6] == 3 ) {
	    $i->[3] .= "*";
	}

	push @totals, { "name" => $i->[0],
			"points" => $i->[11],
			"event" => $i->[2],
			"race"=> $i->[3],
			"position" => $position,
			"eventtype" => $i->[7],
			"bonuspoints" => formatPoints($i->[8]),
			"positionpoints" => formatPoints($i->[1]),
			"date" => $i->[9],
			"url" => myLapsURL($i->[10]),
	};
    }

    if ( $sortby eq "points" ) {
	@totals = sort { $b->{"points"} <=> $a->{"points"} } @totals;
    }
    else {
	@totals = sort { $a->{"date"} cmp $b->{"date"} } @totals;
    }

    return @totals;
}

sub formatPoints {
    my $points = shift;

    if ( int($points) == $points ) {
	return int($points);
    }
    else {
	return sprintf( "%1.1f", $points );
    }
}
