#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use DateTime;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $year = getYear();
    my $races = $self->dbh->selectall_arrayref( "select s.race_id, s.car_number, s.full_name, s.status, s.dq_reason, r.description as 'race', e.description as 'event', r.mylaps_url from results s, race r, event e where YEAR(r.date) >= ? and r.race_id = s.race_id and r.event_id = e.event_id and r.session_type between 3 and 5 and s.status in ( 3, 4 ) ORDER BY r.date, s.full_name", { Slice => {} }, $year );

    return $self->tt_process( 'dq.html', 
			      { RACES => $races,
			      },
	                    );
}

sub update_dq : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $count = $cgi->param( "race_count" );

    foreach my $i ( 1 .. $count ) {
	next if !$cgi->param( "check_$i" );

	my $race_id = $cgi->param( "race_$i" );
	my $full_name = $cgi->param( "name_$i" );
	my $status = $cgi->param( "status_$i" );
	my $dq_reason = $cgi->param( "reason_$i" );

	$self->dbh->do( "UPDATE results SET dq_reason = ?, status = ? WHERE race_id = ? AND full_name = ? AND status in ( 3,4 )", {}, $dq_reason, $status, $race_id, $full_name );
    }

    my $year = getYear();
    $self->dbh->do( "call update_regions($year)" );
    $self->dbh->do( "UPDATE cacheTimestamp SET lastUpdate = NOW()" );

    return $self->main_page();
}

sub getYear {
    my $dt = DateTime->now;

    return $dt->year - ( $dt->month == 1 ? 1 : 0 );
}
