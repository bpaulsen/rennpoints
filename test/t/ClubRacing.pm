package TestsFor::RennPoints::ClubRacing;
use Test::Class::Moose;
use RennPoints::ClubRacing;
use File::Slurp qw(read_file);

    # methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_1")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 2, "Testing number of events that were parsed";
    is $clubracing->events->[0]->{description}, '2018-03 COTA', 'Check description of first race';
}

sub test_url {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_1")) ), 'RennPoints::ClubRacing';
    ok $clubracing->url, 'test that URL is not null';
}

1;
