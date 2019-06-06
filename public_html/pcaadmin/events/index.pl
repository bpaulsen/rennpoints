#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use RennPoints::MyLaps;
use RennPoints::MyLaps::Event;
use RennPoints::DB::Track;
use RennPoints::PCA;
use RennPoints::ClubRacing;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;

    my $track_data = RennPoints::DB::Track->new( dbh => $self->dbh )->track_list;
    my %tracks = map { $_->{ track_id } => $_->{ name } } @$track_data;

    my %pca = ( "" => "Please Choose One" );
    foreach my $event ( @{RennPoints::ClubRacing->new->events} ) {
	$pca{ $event->{ description } } = $event->{ description };
    }
    foreach my $event ( @{RennPoints::PCA->new->events} ) {
	$pca{ $event->{ url } } = $event->{ description };
    }

    my $events = $self->get_events();

    return $self->tt_process('updateEvents.html', 
			     { EVENTS => $events,
			       TRACKS => \%tracks,
			       PCAURLS => \%pca,
			     },
	                    );
}

sub get_events {
    my $self = shift;

    my $mylaps = RennPoints::MyLaps->new();
    my $events = $mylaps->events;

    my $clubreg_list = $self->dbh->selectall_arrayref( "SELECT clubreg_id, track_id, date, end_date, registration, UNIX_TIMESTAMP(date) AS 'unix_timestamp' FROM clubreg_urls", { Slice => {} } );
    my $event_list = $self->dbh->selectall_arrayref( "SELECT mylaps_id, description, date, pca_url, track_id, event_type FROM event", { Slice => {} } );

    my @events = map { { DATE => $_->{ date },
			 ID => $_->{id},
			 URL => RennPoints::MyLaps::Event->new( id => $_->{id} )->url,
			 DESCRIPTION => $_->{ title },
			 TYPE => 1,
			 STATUSTYPE => 0,
		       # MILES => ???
                     } } @$events;

    foreach my $event ( @events ) {
	my ( $track_name ) = $event->{ DESCRIPTION } =~ /\s+\-\s+2[01]\d\d\s+(.*)/xo;
	$event->{TRACKID} = RennPoints::DB::Track->new( name => $track_name )->id;

	my ( $clubreg ) = grep { $_->{ date } eq $event->{ DATE } && $_->{ track_id } == $event->{TRACKID} } @$clubreg_list;
	$event->{ CLUBREGID } = $clubreg->{ clubreg_id } if $clubreg;

	( $event->{CLUBREGID} ) = $self->dbh->selectrow_array( "SELECT clubreg_id FROM clubreg_urls WHERE track_id = ? AND date BETWEEN DATE_ADD( ?, INTERVAL -10 DAY ) AND DATE_ADD( ?, INTERVAL 10 DAY )", {}, $event->{TRACKID}, $event->{DATE}, $event->{DATE} ) if !$event->{CLUBREGID};

	( $event->{CLUBREGID} ) = $self->dbh->selectrow_array( "SELECT clubreg_id FROM clubreg_urls WHERE track_id IN ( 19, 75 ) AND date BETWEEN DATE_ADD( ?, INTERVAL -3 DAY ) AND DATE_ADD( ?, INTERVAL 3 DAY )", {}, $event->{DATE}, $event->{DATE} ) if !$event->{CLUBREGID} && $event->{TRACKID} == 19;

	my ( $mylaps_event ) = grep { ( $_->{ date } eq $event->{ DATE } && $_->{ track_id } eq $event->{TRACKID} ) || $_->{description} eq $event->{DESCRIPTION} } @$event_list;
	if ( !$mylaps_event ) {
	    $event->{STATUS} = 'NEW EVENT';
	    $event->{STATUSTYPE} = 1;
	}
	else {
	    $event->{ PCAURL } = $mylaps_event->{ pca_url };
	    $event->{ TYPE } = $mylaps_event->{ event_type };

	    my %track_remap = ( 103 => 62, # Buttonwillow #13
				104 => 62, # Buttonwillow CCW
				75 => 19, # Mid-Ohio
				96 => 89, # NOLA
				77 => 68, # NJMP
				14 => 87, # Gingerman
		);
				
	    $event->{ TRACKID } = $mylaps_event->{ track_id } if $track_remap{$mylaps_event->{track_id}} && $event->{TRACKID} == $track_remap{$mylaps_event->{track_id}};
	    $event->{ TRACKID } = $mylaps_event->{ track_id } if $mylaps_event->{track_id} == 86; # Mazda Laguna Seca
	    if ( $mylaps_event->{ mylaps_id } != $event->{ID} || $event->{TRACKID} != $mylaps_event->{track_id}) {
		$event->{ TRACKID } = $mylaps_event->{ track_id };
		$event->{STATUS} = 'UPDATED EVENT';
		$event->{STATUSTYPE} = 2;
	    }
	}
    }

    @events = grep { $_->{DATE} gt '2006-01-01' } @events; # show only events after 2006
    @events = grep { $_->{ID} != 850335 && $_->{ID} != 76417 && $_->{ID} != 1461941 && $_->{ID} != 1518795 } @events; # skip erroneous events in mylaps
    @events = sort { $b->{STATUSTYPE} <=> $a->{STATUSTYPE} || $b->{DATE} cmp $a->{DATE} } @events;
    @events = @events[0..10];

    return \@events;
}

sub update_event : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $count = $cgi->param( "event_count" );

    foreach my $i ( 1 .. $count ) {
	next if !$cgi->param( "check_$i" );

	my %event_info = ( DESCRIPTION => $cgi->param( "description_$i" ),
			   TRACKID => $cgi->param( "track_$i" ),
			   DATE => $cgi->param( "date_$i" ),
			   URL => $cgi->param( "url_$i" ),
			   ID => $cgi->param( "id_$i" ),
			   STATUSTYPE => $cgi->param( "status_$i" ),
			   TYPE => $cgi->param( "type_$i" ),
			   PCAURL => $cgi->param( "pca_$i" ),
	    );
	if ( $cgi->param( "clubregid_$i" ) ) {
	    $event_info{ CLUBREGID } = $cgi->param( "clubregid_$i" );
	}

	$self->upsertMyLapsEvent( %event_info );
    }

    return $self->main_page();
}

sub deleteMyLapsEvent {
    my $self = shift;
    my %ARGS = @_;
    my $dbh = $ARGS{DBH} || $self->dbh();

    my ( $eventid ) = $dbh->selectrow_array( "SELECT event_id FROM event WHERE clubreg_id = ?", {}, $ARGS{CLUBREGID} );
    if ( !$eventid ) {
	( $eventid ) = $dbh->selectrow_array( "SELECT event_id FROM event WHERE description = ?", {}, $ARGS{DESCRIPTION} );
    }
    return if !$eventid;

    $dbh->do( "DELETE FROM results WHERE race_id IN ( SELECT race_id FROM race WHERE event_id = ? )", {}, $eventid );
    $dbh->do( "DELETE FROM race WHERE event_id = ?", {}, $eventid );
    $dbh->do( "UPDATE event SET mylaps_url = ?, mylaps_id = ? WHERE event_id = ?", {}, $ARGS{URL}, $ARGS{ID}, $eventid );
    return;
}

sub upsertMyLapsEvent {
    my $self = shift;
    my %ARGS = @_;
    my $dbh = $ARGS{DBH} || $self->dbh();
    my $status = $ARGS{STATUSTYPE};

    $self->deleteMyLapsEvent( %ARGS, DBH => $dbh ) if $status == 2;

    my ( $count ) = $dbh->selectrow_array( "select count(*) from event where mylaps_url = ?", {}, $ARGS{URL} );

    if ( !$count ) {
	( $count ) = $dbh->selectrow_array( "select count(*) from event where description = ?", {}, $ARGS{DESCRIPTION} );
	if ( !$count ) {
	    $dbh->do( "insert into event ( date, description, mylaps_url, mylaps_id ) values ( ?, ?, ?, ? )", {}, $ARGS{DATE}, $ARGS{DESCRIPTION}, $ARGS{URL}, $ARGS{ID} );
	}
    }

    $dbh->do( "update event set date = ?, track_id = ?, description = ?, event_type = ?, pca_url = ? where mylaps_url = ?", {},
	      $ARGS{DATE}, $ARGS{TRACKID}, $ARGS{DESCRIPTION}, $ARGS{TYPE}, $ARGS{PCAURL}, $ARGS{URL} );
    if ( $ARGS{CLUBREGID} ) {
	$dbh->do( "update event set clubreg_id = ? where mylaps_url = ?", {},
		  $ARGS{CLUBREGID}, $ARGS{URL} );
    }

#    if ( $ARGS{MILES} ) {
#	$dbh->do( "UPDATE track SET miles = ? WHERE track_id = ?", {}, $ARGS{MILES}, $ARGS{TRACKID} );
#    }

    return;
}
