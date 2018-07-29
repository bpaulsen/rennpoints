#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( getDBConnection formatTime searchForRacer );
use HTML::Template;
use CGI;
use List::Util qw(sum);
use Data::Dumper;

printPage();

sub printPage {
    my $cgi = new CGI;
    my $dbh = getDBConnection();

    my $template = HTML::Template->new(filename => "driverhistory.html",
				       associate => $cgi,
				       global_vars => 1,
				       die_on_bad_params => 0,
				       loop_context_vars => 1,
	);

    my $searchfield = $cgi->textfield( -name => "search",
				       -size => 40,
				       -id => "racers",
				       # -onchange => "submit();",
	                             );

    $template->param( driverstab => 1,
		      BASEURL => "../",
	);

    $template->param( "searchfield" => $searchfield );

    my $search = $cgi->param("search");
    my $racer = $cgi->param( "racer" );
    if ( $search && !$racer ) {
	my $data = searchForRacer( DBH => $dbh,
				   SEARCH => $search,
	    );

	if ( $#$data == 0 ) {
	    $cgi->param( "racer" => $data->[0]->{racer_id} );
	}

	$template->param( "searchmatches" => $data );
    }

    $racer = $cgi->param( "racer" );
    my $soloTimes = getBestLapTimes( $dbh, $racer, 0 );
    my $codriverTimes = getBestLapTimes( $dbh, $racer, 1 );
    my $raceHistory = getRaceResults( $dbh, $racer );

    my $racer_param = $cgi->param("racer");
    my ( $racer_name ) = $dbh->selectrow_array( "SELECT CASE WHEN givenname IS NULL OR surname IS NULL THEN clubreg_name ELSE CONCAT(IFNULL(givenname, ''), ' ', IFNULL(surname, '') ) END FROM racer WHERE racer_id = ?", {}, $racer_param );

    $template->param( racer_name => $racer_name );
    $template->param( soloresults => $soloTimes ) if $soloTimes && $racer_param;
    $template->param( codriverresults => $codriverTimes ) if $codriverTimes && $racer_param;

    if ( $raceHistory ) {
	my $numraces = 1 + $#$raceHistory;
	my $classwins = sum( map { $_->{ class_win } } @$raceHistory );
	my $classpodiums = sum( map { $_->{ class_podium } } @$raceHistory );
	my $groupwins = sum( map { $_->{ group_win } } @$raceHistory );
	my $grouppodiums = sum( map { $_->{ group_podium } } @$raceHistory );
	$template->param( raceresults => $raceHistory );
	$template->param( numraces => $numraces );

	$template->param( numraces => $numraces );
	$template->param( classwins => $classwins );
	$template->param( classpodiums => $classpodiums );
	$template->param( groupwins => $groupwins );
	$template->param( grouppodiums => $grouppodiums );

	$template->param( classwinpercentage    => $numraces ? int( 100.0 * $classwins/ $numraces + 0.5 )    : 0 );
	$template->param( classpodiumpercentage => $numraces ? int( 100.0 * $classpodiums/ $numraces + 0.5 ) : 0 );
	$template->param( groupwinpercentage    => $numraces ? int( 100.0 * $groupwins/ $numraces + 0.5 )    : 0 );
	$template->param( grouppodiumpercentage => $numraces ? int( 100.0 * $grouppodiums/ $numraces + 0.5 ) : 0 );
    }

    # send the obligatory Content-Type and print the template output
    print $cgi->header;
    print $template->output;
    return;
}

sub getBestLapTimes {
    my $dbh = shift;
    my $id = shift;
    my $codriver = shift || 0;

    return if !$id;

    my $query = <<"EOF";
select X2.*, S3.class, S3.full_name, DATE(R3.date) as 'date', S3.race_id, R3.mylaps_id AS 'id'
from results S3, race R3,
   ( select min(S2.best_lap_time) as 'class_record',
     X.track_id,
     X.current_class, X.best_lap_time, 100 * min(S2.best_lap_time) / X.best_lap_time as 'percentage', count(distinct racer_id) as 'racers', T.short_name
     from race R2, results S2, track T,
        (  select R.track_id, S.current_class, min(S.best_lap_time) as 'best_lap_time'
           from results S, race R
           WHERE S.best_lap_time > 40
           AND S.race_id = R.race_id
           AND    (    ( 0 = ? AND S.racer_id = ? AND S.coracer_id = 0 ) 
                    OR ( 1 = ? AND S.coracer_id > 0 AND ( S.racer_id = ? OR S.coracer_id = ? ) )
                  )
           AND    S.current_class IS NOT NULL
           AND    S.status != 3
           AND    S.class_record_eligible = 1
           group by R.track_id, S.current_class
         ) as X
     where R2.race_id = S2.race_id
     and S2.best_lap_time > 40
     and S2.current_class = X.current_class
     and S2.class_record_eligible = 1
     and R2.track_id = X.track_id
     AND S2.status != 3
     AND X.track_id = T.track_id
     group by X.track_id, X.current_class
   ) AS X2
WHERE S3.best_lap_time > 40
AND   S3.race_id = R3.race_id
AND   (    ( 0 = ? AND S3.racer_id = ? AND S3.coracer_id = 0 ) 
        OR ( 1 = ? AND S3.coracer_id > 0 AND ( S3.racer_id = ? OR S3.coracer_id = ? ) )
      )
AND   S3.current_class IS NOT NULL
AND   S3.status != 3
AND   S3.class_record_eligible = 1
AND   X2.track_id = R3.track_id
AND   X2.best_lap_time = S3.best_lap_time
EOF

    my $data = $dbh->selectall_hashref( $query, "race_id", {}, $codriver, $id, $codriver, $id, $id, $codriver, $id, $codriver, $id, $id );
    my @results = sort { $b->{percentage} <=> $a->{percentage} || $b->{ racers } <=> $a->{ racers } || $b->{date} cmp $a->{date} } values %$data;
    foreach my $i ( @results ) {
	$i->{current_class} ||= "";
	$i->{class_record} = formatTime( $i->{class_record} );
	$i->{best_lap_time} = formatTime( $i->{best_lap_time} );
	$i->{percentage} = sprintf( "%1.1f", $i->{percentage} );
    }

    return \@results;
}

sub getRaceResults {
    my $dbh = shift;
    my $id = shift;

    return if !$id;

    my $query = <<"EOF";
SELECT T.short_name, DATE(R.date) as 'date', R.session_type, R.description, S.full_name, S.position_on_results_page, R.mylaps_id AS 'id',
       S.position_in_class, S.class, S.best_lap_time, S.status, 
       ( SELECT COUNT(*) FROM results S2 WHERE S2.race_id = S.race_id AND S2.class = S.class AND S2.status <= 2 ) as 'class_size',
       ( SELECT COUNT(*) FROM results S2 WHERE S2.race_id = S.race_id AND S2.status <= 2 ) as 'race_size'
from   results     S,
       race        R,
       track       T
where  ( S.racer_id = ? OR S.coracer_id = ? )
and    S.race_id = R.race_id
and    R.track_id = T.track_id
and    R.session_type in ( 3,4, 5)
order by 2 desc
EOF
 
    my $data = $dbh->selectall_arrayref( $query, { Slice => {} }, $id, $id );

    foreach my $i ( @$data ) {
	$i->{ best_lap_time } = $i->{best_lap_time} < 30 ?  "" : formatTime( $i->{ best_lap_time } );
	if ( $i->{status} == 2 ) {
	    $i->{ position_on_results_page } = "DNF";
	    $i->{ position_in_class } = "DNF";
	    $i->{ class_win } = 0;
	    $i->{ group_win } = 0;
	    $i->{ class_podium } = 0;
	    $i->{ group_podium } = 0;
	}
	elsif ( $i->{status} == 3 || $i->{status} == 4 ) {
	    $i->{ position_on_results_page } = "DQ";
	    $i->{ position_in_class } = "DQ";
	    $i->{ class_win } = 0;
	    $i->{ group_win } = 0;
	    $i->{ class_podium } = 0;
	    $i->{ group_podium } = 0;
	}
	else {
	    $i->{ class_win } = $i->{ position_in_class } == 1 ? 1 : 0;
	    $i->{ group_win } = $i->{ position_on_results_page } == 1 ? 1 : 0;
	    $i->{ class_podium } = $i->{ position_in_class } <= 3 ? 1 : 0;
	    $i->{ group_podium } = $i->{ position_on_results_page } <= 3 ? 1 : 0;
	    $i->{ position_in_class } .= " / $i->{ class_size }";
	    $i->{ position_on_results_page } .= " / $i->{ race_size }";
	}
    }

    return $data;
}
