#!/usr/bin/perl -w

use warnings;
use strict;
use CGI;
use RennPoints qw( getDBConnection formatTime getLapTimePrediction getTracks getClasses );
use HTML::Template;
use List::Util qw( sum );

printPage();

sub printPage {
    my $cgi = new CGI;
    my $dbh = getDBConnection();

    my %tracks = getTracks($dbh);
    my @classes = getClasses( $dbh );
    my $racer = $cgi->param("racer");
    my $track = $cgi->param("track");
    my $class = $cgi->param("class");

    if ( !$class ) {
        $class = getMostRecentClass( $dbh, $racer );
	$cgi->param( "class" => $class );
    }

    my $track_popup = $cgi->popup_menu( -name   => "track",
					-values => [ 0, sort { $tracks{$a} cmp $tracks{$b} } keys %tracks ],
					-labels => { "0" => "Choose A Track", %tracks },
					-default => 0,
					-onchange => "submit();",
	);

    my $class_popup = $cgi->popup_menu( -name   => "class",
					-values => [ "", @classes ],
					-labels => { "" => "Choose A Class" },
					-default => "",
					-onchange => "submit();",
	);

    my $percentage_popup = $cgi->popup_menu( -name   => "delta_percentage",
					-values => [ 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10 ],
					-default => 4,
					-onchange => "submit();",
	);

    my $inclass_popup = $cgi->popup_menu( -name => "class_choices",
					-values => [ "Prefer In Class", "All Classes" ],
					-default => "Prefer In Class",
					-onchange => "submit();",
	);

    my ( $racername ) = $dbh->selectrow_array( "select clubreg_name from racer where racer_id = ?", {}, $racer );
    my ( $trackname, $shortname ) = $dbh->selectrow_array( "select name, short_name from track where track_id = ?", {}, $track );

    my $template = HTML::Template->new(filename => "predictions.html",
				       associate => $cgi,
				       global_vars => 1,
				       die_on_bad_params => 0,
				       loop_context_vars => 1,
	);

    $template->param( driverstab => 1,
		      BASEURL => "../",
	);

    my $delta_percentage = $cgi->param("delta_percentage");
    my $class_choices = $cgi->param("class_choices");
    my $in_class_preferred = $class_choices && ( $class_choices eq "All Classes" ) ? 0 : 1;
    my $predictions;
    $predictions = getLapTimePrediction( DBH     => $dbh,
                                         TRACKID => $track,
                                         NAME    => $racername,
                                         RACERID => $racer,
                                         CLASS   => $class,
                                         DELTA_PERCENTAGE => $delta_percentage,
                                         IN_CLASS_PREFERRED => $in_class_preferred,
	) if $track;

    if ( $#$predictions >= 0 ) {
	my $average = sum( map { $_->{prediction} } @$predictions ) / ( 1 + $#$predictions );
	$template->param( prediction  => formatTime($average) );
    }

    foreach my $i ( @$predictions ) {
	$i->{racer_best_lap_time}          = formatTime($i->{racer_best_lap_time});
	$i->{prediction}          = formatTime($i->{prediction});
	$i->{competitor_track_time} = formatTime($i->{competitor_track_time});
	$i->{best_lap_time}       = formatTime($i->{competitor_best_time});
	$i->{class_record}        = formatTime($i->{class_record});
	$i->{racer_class_record}  = formatTime($i->{racer_class_record});
	$i->{track_competitor_record}  = formatTime($i->{track_competitor_record});
	$i->{competitor_percentage}          = sprintf("%1.1f", $i->{competitor_percentage} * 100 );
	$i->{racer_percentage}    = sprintf("%1.1f", $i->{racer_percentage} * 100 );
	$i->{competitor_track_percentage}    = sprintf("%1.1f", $i->{competitor_track_percentage} * 100 );
	$i->{combined_percentage} = sprintf("%1.1f", $i->{combined_percentage} * 100 );
    }

    $template->param( predictions      => $predictions,
		      racer_name       => $racername,
		      track_name       => $trackname,
		      track_short_name => $shortname,
		      track_popup      => $track_popup,
		      class_popup      => $class_popup,
		      percentage_popup      => $percentage_popup,
		      inclass_popup => $inclass_popup,
	            );

    my $actualbest = actualBest( $dbh, $racer, $track, $class );
    if ( $actualbest ) {
	$template->param( "actual_best" => formatTime($actualbest) );
    }

    # send the obligatory Content-Type and print the template output
    print $cgi->header;
    print $template->output;
    return;
}

sub getMostRecentClass {
    my $dbh = shift;
    my $id = shift;

    my $query = <<"EOF";
SELECT current_class, count(*)
FROM   event E, results S, race R,
  ( SELECT DISTINCT E.*
    FROM   event E, results S, race R
    WHERE  S.racer_id = ?
    AND    S.race_id    = R.race_id
    AND    R.event_id   = E.event_id
    ORDER BY E.date desc
    LIMIT 0,1
  ) AS X
WHERE S.racer_id  = ?
AND   S.race_id    = R.race_id
AND   R.event_id   = E.event_id
AND   E.event_id   = X.event_id
GROUP BY S.current_class
ORDER BY 2 desc
LIMIT 0,1
EOF

    my ( $class ) = $dbh->selectrow_array( $query, {}, $id, $id );

    return $class;
}

sub actualBest {
    my $dbh = shift;
    my $racer = shift;
    my $track = shift;
    my $class = shift;

    my $query =<< "EOF";
SELECT MIN(S.best_lap_time)
FROM   race R, results S
WHERE  S.racer_id = ?
AND    R.track_id = ?
AND    S.current_class = ?
AND    S.race_id = R.race_id
AND    S.coracer_id = 0
AND    S.best_lap_time > 40
AND    S.status != 3
EOF

    my ( $actualbest ) = $dbh->selectrow_array( $query, {}, $racer, $track, $class );

    return $actualbest;
}

