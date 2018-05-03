#!/usr/bin/perl -w

use warnings;
use strict;

use base 'CGIBase';
use RennPoints qw( formatTime getDetailedClassRecords getTracks getClasses myLapsURL );

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $dbh = $self->dbh();
    my $class = $cgi->param("class");
    my $track = $cgi->param("track");
    my $detail = $cgi->param("detail") || 0;

    my %templateParams = ( CLASSES => [ getClasses( $dbh ) ],
			   TRACKS => { getTracks($dbh) },
                           CLASS => $class,
                           TRACK => $track,
	);

    if ( $track && $class ) {
	my $times;

	if ( $detail == 1 ) {
	    $times = getFastestTimes( DBH     => $dbh,
				      TRACKID => $track,
				      CLASS   => $class,
				      SESSION => scalar($cgi->param("session")),
	                            );
	}
	elsif ( $detail == 2 ) {
	    $times = getFastestRacers( DBH     => $dbh,
				       TRACKID => $track,
				       CLASS   => $class,
				       SESSION => scalar($cgi->param("session")),
		                     );
	}
	else {
	    $times = getRecordHistory( DBH     => $dbh,
				       TRACKID => $track,
				       CLASS   => $class,
				       SESSION => scalar($cgi->param("session")) || 0,
		                     );
	}
	$templateParams{ RESULTS } = $times;
    }
    elsif ( $track || $class ) {
	my $times = getDetailedClassRecords( DBH     => $dbh,
				             TRACKID => $track,
					     CLASS   => $class,
					     SESSION => scalar($cgi->param("session")),
	                                   );
	$templateParams{ RESULTS } = $times;
    }

    # send the obligatory Content-Type and print the template output
    return $self->tt_process('classrecords.html',
			     \%templateParams,
	                    );
}

sub getRecordHistory {
    my %ARGS = @_;
    my $dbh     = $ARGS{DBH};
    my $trackid = $ARGS{TRACKID} || 0;
    my $class   = $ARGS{CLASS}   || "";
    my $session = $ARGS{SESSION} || 0;

    my $query = <<"EOF";
select *
from ( select r.date, S.full_name AS 'racer', r.mylaps_url AS 'url', S.current_class AS 'class', S.best_lap_time AS 'rawtime',
              t.short_name AS 'track', ST.type AS 'session_type', r.track_id as 'trackid', S.racer_id
       from results S, race r, track t, session_types ST
       where r.track_id = ?
       and r.race_id = S.race_id
       and current_class = ?
       and best_lap_time > 40
       and r.track_id = t.track_id
       AND r.session_type = ST.session_type
       and S.status != 3
       and S.class_record_eligible = 1
       AND     ( ? = 0 OR ( ? = 7 AND r.session_type BETWEEN 3 AND 5 ) OR r.session_type = ? )
       order by r.date, S.best_lap_time
     ) as X
group by X.date
EOF

    my $data = $dbh->selectall_arrayref( $query, { Slice => {}}, $trackid, $class, $session, $session, $session );
    my @results;
    my $besttime = 100000;
    foreach my $i ( @$data ) {
	if ( $i->{ rawtime } < $besttime ) {
	    $i->{ laptime } = formatTime( $i->{ rawtime } );
	    $i->{url} = myLapsURL( $i->{url} );
	    $besttime = $i->{ rawtime };
	    push @results, $i;
	}
    }
    @results = reverse @results;

    return \@results;
}

sub getFastestTimes {
    my %ARGS = @_;
    my $dbh     = $ARGS{DBH};
    my $trackid = $ARGS{TRACKID} || 0;
    my $class   = $ARGS{CLASS}   || "";
    my $session = $ARGS{SESSION} || 0;

    my $query = <<"EOF";
select r.date, S.full_name AS 'racer', r.mylaps_url AS 'url', S.current_class AS 'class', S.best_lap_time AS 'rawtime',
       t.short_name AS 'track', st.type AS 'session_type', r.track_id as 'trackid', S.racer_id
from results S, race r, session_types st, track t
where r.track_id = ?
and S.current_class = ?
and S.best_lap_time > 40
and S.status != 3
and S.class_record_eligible = 1
and S.race_id = r.race_id
and t.track_id = r.track_id
and r.session_type = st.session_type
AND ( ? = 0 OR ( ? = 7 AND r.session_type BETWEEN 3 AND 5 ) OR r.session_type = ? )
order by S.best_lap_time
limit 0,10;
EOF

    my $data = $dbh->selectall_arrayref( $query, { Slice => {}}, $trackid, $class, $session, $session, $session );
    foreach my $i ( @$data ) {
	$i->{ laptime } = formatTime( $i->{ rawtime } );
	$i->{url} = myLapsURL( $i->{url} );
    }

    return $data;
}

sub getFastestRacers {
    my %ARGS = @_;
    my $dbh     = $ARGS{DBH};
    my $trackid = $ARGS{TRACKID} || 0;
    my $class   = $ARGS{CLASS}   || "";
    my $session = $ARGS{SESSION} || 0;

    my $query = <<"EOF";
select * from
(select r.date, S.full_name AS 'racer', r.mylaps_url AS 'url', S.current_class AS 'class', min(S.best_lap_time) AS 'rawtime',
 t.short_name AS 'track', st.type AS 'session_type', r.track_id as 'trackid', S.racer_id,S.coracer_id
from results S, race r, session_types st, track t
where r.track_id = ?
and S.current_class = ?
and S.best_lap_time > 40
and S.status != 3
and S.class_record_eligible = 1
and S.race_id = r.race_id
and t.track_id = r.track_id
and r.session_type = st.session_type
and S.racer_id is not null
AND ( ? = 0 OR ( ? = 7 AND r.session_type BETWEEN 3 AND 5 ) OR r.session_type = ? )
group by S.racer_id, S.coracer_id ) as X
order by X.rawtime
limit 0,10;
EOF

    my $data = $dbh->selectall_arrayref( $query, { Slice => {}}, $trackid, $class, $session, $session, $session );
    foreach my $i ( @$data ) {
	$i->{ laptime } = formatTime( $i->{ rawtime } );
	$i->{url} = myLapsURL( $i->{url} );
    }

    return $data;
}
