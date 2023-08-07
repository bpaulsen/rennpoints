package TestsFor::RennPoints::MyLaps::Event;
use Test::Class::Moose;
use RennPoints::MyLaps::Event;
use File::Slurp qw(read_file);

    # methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $event = RennPoints::MyLaps::Event->new( content => scalar(read_file("test_files/mylaps/event_1")), id => 0 ), 'RennPoints::MyLaps::Event';
    is @{$event->races}, 10, "Testing number of races that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $event = RennPoints::MyLaps::Event->new( id => 0 ), 'RennPoints::MyLaps::Event';
    ok $event->url, 'test that URL is not null';
}

1;
