#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use RennPoints::ClubRegistration;
use RennPoints::DB::Track;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    my $track_data = RennPoints::DB::Track->new( dbh => $self->dbh )->track_list;
    my %tracks = map { $_->{ track_id } => $_->{ name } } @$track_data;

    my $clubreg_track_ids = $self->dbh->selectall_hashref( "SELECT clubreg_id, track_id, date, end_date, registration, cancelled FROM clubreg_urls", "clubreg_id" );

    my $clubreg = RennPoints::ClubRegistration->new();
    my $events = $clubreg->races;

    foreach my $event ( @$events ) {
	$event->{TRACKID} = $clubreg_track_ids->{ $event->{ID} }->{ track_id } ||
	    RennPoints::DB::Track->new( dbh => $self->dbh, city => $event->{CITY}, state => $event->{STATE}, name => $event->{TRACKNAME} )->id;

	my $track = RennPoints::DB::Track->new( id => $event->{TRACKID} );

	$event->{CITY} ||= $track->city;
	$event->{STATE} ||= $track->state;
	$event->{EVENTCOUNT} = $track->event_count;
	$event->{UPDATE} = checkEventData( CLUBREG => $clubreg_track_ids,
					   TRACK => $track,
					   %$event );
    }

    # $events = getRacesFromClubRegistration();

    return $self->tt_process( 'upcomingRaces.html',
			      { EVENTS => $events,
				TRACKS => \%tracks,
			      },
	                    );
}

sub checkEventData {
    my %ARGS = @_;
    my $track = $ARGS{TRACK};
    my $clubreg = $ARGS{CLUBREG}->{$ARGS{ID}} || {};

    my @needsUpdate;

    my $city = $track->city;
    my $state = $track->state;
    push @needsUpdate, ( "city" . ( $city ? " ($city)" : "" )) if $city ne $ARGS{CITY};
    push @needsUpdate, ( "state" . ( $state ? " ($state)" : "" )) if $state ne $ARGS{STATE};

    my $trackid = $clubreg->{ track_id };
    my $start = $clubreg->{date};
    my $end = $clubreg->{end_date};
    my $registration = $clubreg->{registration};
    my $cancelled = $clubreg->{cancelled} || 0;

    if ( !$trackid && !$start && !$end && !$registration ) {
	push @needsUpdate, "New Event";
    }
    else {
	push @needsUpdate, ( "start" . ( $start ? " ($start)" : "" )) if $start ne formatDate($ARGS{STARTDATE});
	push @needsUpdate, ( "end" . ( $end ? " ($end)" : "" )) if $end ne formatDate($ARGS{ENDDATE});
	push @needsUpdate, ( "registration" . ( $registration ? " ($registration)" : "" )) if ($registration || "") ne formatDate($ARGS{REGISTRATION});
	push @needsUpdate, ( "track ID" . ( $trackid ? " ($trackid)" : "" )) if $trackid ne $ARGS{TRACKID};
	push @needsUpdate, ( "cancelled" . ( $cancelled ? " ($cancelled)" : "" )) if $cancelled != ($ARGS{CANCELLED}||0);
    }

    return "" if @needsUpdate == 0;

    return join( ", ", @needsUpdate );
}

sub update_clubreg : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $count = $cgi->param( "event_count" );

    foreach my $i ( 1 .. $count ) {
	next if !$cgi->param( "check_$i" );

	my %event_info = ( ID => scalar($cgi->param( "id_$i" )),
			   LOCATION => scalar($cgi->param( "location_$i" )),
			   REGISTRATION => scalar($cgi->param( "registration_$i" )),
			   STARTDATE => scalar($cgi->param( "startdate_$i" )),
			   ENDDATE => scalar($cgi->param( "enddate_$i" )),
			   TRACKID => scalar($cgi->param( "trackid_$i" )),
			   CITY => scalar($cgi->param( "city_$i" )),
			   STATE => scalar($cgi->param( "state_$i" )),
			   CANCELLED => scalar($cgi->param( "cancelled_$i" )),
	    );

	$self->upsertClubRegistrationEvent( %event_info );
    }

    return $self->main_page();
}

sub upsertClubRegistrationEvent {
    my $self = shift;
    my %ARGS = @_;

    my $start = formatDate($ARGS{STARTDATE});
    my $end = formatDate($ARGS{ENDDATE});
    my $registration = formatDate( $ARGS{REGISTRATION} );
    my $location = $ARGS{LOCATION};
    my $id = $ARGS{ID};
    my $cancelled = $ARGS{CANCELLED} || 0;
    my $trackid = $ARGS{TRACKID};
    return if !$trackid;
    my $dbh = $self->dbh;

    if ( $ARGS{CITY} && $ARGS{STATE} ) {
	$dbh->do( "UPDATE track SET city = ?, state = ? WHERE track_id = ?", {}, $ARGS{CITY}, $ARGS{STATE}, $trackid );
    }

    my ( $count ) = $dbh->selectrow_array( "SELECT COUNT(*) FROM clubreg_urls WHERE clubreg_id = ?", {}, $id );
    $dbh->do( "INSERT clubreg_urls ( track_id, date, end_date, clubreg_id ) VALUES ( ?, ?, ?, ? )", {}, $trackid, $start, $end, $id ) if !$count;

    $dbh->do( "UPDATE clubreg_urls SET registration = ? WHERE clubreg_id = ?", {}, $registration ? $registration : undef, $id );
    $dbh->do( "UPDATE clubreg_urls SET date = ? WHERE clubreg_id = ?", {}, $start, $id ) if $start;
    $dbh->do( "UPDATE clubreg_urls SET end_date = ? WHERE clubreg_id = ?", {}, $end, $id ) if $end;
    $dbh->do( "UPDATE clubreg_urls SET track_id = ? WHERE clubreg_id = ?", {}, $trackid, $id ) if $trackid;
    $dbh->do( "UPDATE clubreg_urls SET cancelled = ? WHERE clubreg_id = ?", {}, $cancelled ? 1 : 0, $id );

    return;
}

sub formatDate {
    my $date = shift;

    return "" if !$date;

    my ( $mm, $dd, $yy ) = $date =~ m{(\d\d)/(\d\d)/(\d\d)}x;
    return $date if !$mm;

    return "20$yy-$mm-$dd";
}

