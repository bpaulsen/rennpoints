#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( getDBConnection );
use HTML::Template;
use CGI;

printPage();

sub printPage {
    my $cgi = new CGI;
    my $dbh = getDBConnection();

    my $eventid = $cgi->param( "eventid" );
    my $name = $cgi->param( "name" );
    my $transponder = $cgi->param( "transponder" );

    my $resultsList = $dbh->selectall_arrayref( "SELECT S.full_name, R.description, S.car_number, S.class, S.transponder FROM results S, race R WHERE MATCH(S.full_name) AGAINST ( ? ) AND S.race_id = R.race_id AND R.event_id = ? ORDER BY 3, 1, 2", { Slice => {} }, $name, $eventid );

    my $rosterList = $dbh->selectall_arrayref( "SELECT R.clubreg_name, C.* FROM clubreg_roster C, racer R, event E where C.clubreg_id = E.clubreg_id AND E.event_id = ? AND C.racer_id = R.racer_id AND MATCH(R.clubreg_name) AGAINST ( ? )", { Slice => {} }, $eventid, $name );

    my $transponderList = $dbh->selectall_arrayref( "SELECT S.full_name, S.class, S.racer_id, S.coracer_id, count(*) AS 'count' FROM results S WHERE transponder = ? GROUP BY S.full_name, S.class, S.racer_id, S.coracer_id ORDER BY 5 DESC", { Slice => {} }, $transponder );

    my $template = HTML::Template->new(filename => "racerLookup.html",
				       associate => $cgi,
				       global_vars => 1,
				       die_on_bad_params => 0,
				       loop_context_vars => 1,
	);

    if ( $#$resultsList >= 0 ) {
	$template->param( resultsList => $resultsList );
    }
    if ( $#$rosterList >= 0 ) {
	$template->param( rosterList => $rosterList );
    }
    if ( $#$transponderList >= 0 ) {
	$template->param( transponderList => $transponderList );
    }

    print $cgi->header;
    print $template->output;

    return;
}

