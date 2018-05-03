package TestsFor::RennPoints::DB::Track;
use Test::Class::Moose;
use RennPoints::DB::Track;

sub test_build_track {
    my $test = shift;

    isa_ok my $track = RennPoints::DB::Track->new( name => 'Unknown' ), 'RennPoints::DB::Track';

    is $track->id, undef, "Verify that unknown track returns no track id";

    my @tests = ( { id => 23, name => 'Auto Club Speedway', city => 'Fontana', state => 'CA' },
		  { id => 19, name => 'Mid-Ohio Sports Car Course', city => 'Lexington', state => 'OH' },
		  { id => 98, name => 'Gateway Motorsports Park', city => 'Madison', state => 'IL' },
		  { id => 98, name => 'Gateway Motorsports Park', state => 'IL' },
		  { id => 98, name => 'Gateway Motorsports Park' },
		  { id => 17, name => 'Watkins Glen' },
		  { id => 17, name => 'watkins glen' },
		  { id => 2, name => 'Texas World Speedway' },
	);

    foreach my $event ( @tests ) {
	my $track = RennPoints::DB::Track->new( city => $event->{ city },
						state => $event->{ state },
						name => $event->{ name },
	    );

	is $track->id, $event->{id}, 'Track id for ' . ($event->{city} || "") . ' ' . ($event->{state} || "")  . ' ' . $event->{name};
    }

    $track = RennPoints::DB::Track->new( name => 'Watkins Glen' );
    ok $track->event_count > 10, "Check that Watkins Glen event count is greater than 10";
}

1;
