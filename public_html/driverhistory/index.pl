#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( formatTime searchForRacer );
use RennPoints::DBI qw( getDBConnection );
use HTML::Template;
use CGI;
use List::Util qw(sum);
use File::Basename qw(dirname);
use Data::Dumper;

printPage();

sub printPage {
    my $cgi = new CGI;
    my $dbh = getDBConnection();

    my $template = HTML::Template->new(filename => dirname($ENV{SCRIPT_FILENAME}) . "/driverhistory.html",
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

    my $data = $dbh->selectall_hashref( "CALL get_driver_summary(?, ?)", "race_id", {}, $id, $codriver );
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
       ( SELECT COUNT(*) FROM results S2 WHERE S2.race_id = S.race_id AND S2.class = S.class AND S2.status <= 2 ) AS 'class_size',
       ( SELECT COUNT(*) FROM results S2 WHERE S2.race_id = S.race_id AND S2.status <= 2 ) AS 'race_size'
FROM   results     S,
       race        R,
       track       T
WHERE  ( S.racer_id = ? OR S.coracer_id = ? )
AND    S.race_id = R.race_id
AND    R.track_id = T.track_id
AND    R.session_type in ( 3, 4, 5)
ORDER BY 2 DESC
EOF
 
    my $data = $dbh->selectall_arrayref( $query, { Slice => {} }, $id, $id );

    foreach my $i ( @$data ) {
	$i->{best_lap_time} ||= 0;
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
