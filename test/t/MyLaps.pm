package TestsFor::RennPoints::MyLaps;
use Test::Class::Moose;
use RennPoints::MyLaps;
use File::Slurp qw(read_file);

# methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    isa_ok my $mylaps = RennPoints::MyLaps->new( content => scalar(read_file("test_files/mylaps/mylaps_1")) ), 'RennPoints::MyLaps';

    is @{$mylaps->events}, 25, "Testing number of events that were parsed";

    is $mylaps->events->[0]->{id}, 2318956, "Testing event id of first event";
    is $mylaps->events->[0]->{date}, '2023-07-22', "Testing date of first event";

    my @escaped_events = grep { $_->{title} =~ /&#/ } @{$mylaps->events};
    is @escaped_events, 0, "Testing that no escaped events are in the title";
    foreach my $i ( @escaped_events ) {
        unlike $i->{title}, qr/&#/;
    }
}

1;
