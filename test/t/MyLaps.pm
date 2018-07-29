package TestsFor::RennPoints::MyLaps;
use Test::Class::Moose;
use RennPoints::MyLaps;
use File::Slurp qw(read_file);

    # methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    isa_ok my $mylaps = RennPoints::MyLaps->new( content => scalar(read_file("test_files/mylaps/mylaps_1")) ), 'RennPoints::MyLaps';

    is @{$mylaps->events}, 369, "Testing number of events that were parsed";

    my @escaped_events = grep { $_->{title} =~ /&#/ } @{$mylaps->events};
    is @escaped_events, 0, "Testing that no escaped events are in the title";
    foreach my $i ( @escaped_events ) {
        unlike $i->{title}, qr/&#/;
    }
}

sub test_url {
    my $test = shift;

    isa_ok my $mylaps = RennPoints::MyLaps->new( content => scalar(read_file("test_files/mylaps/mylaps_1")) ), 'RennPoints::MyLaps';
    ok $mylaps->url, 'test that URL is not null';
}

1;
