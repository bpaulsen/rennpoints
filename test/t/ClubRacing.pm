package TestsFor::RennPoints::ClubRacing;
use Test::Class::Moose;
use RennPoints::ClubRacing;
use File::Slurp qw(read_file);
use Data::Dumper;

    # methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_1")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 2, "Testing number of events that were parsed";
    is $clubracing->events->[0]->{description}, '2018-03 COTA', 'Check description of first race';
}

sub test_parse_events2 {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_2")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 1, "Testing number of events that were parsed";
    is $clubracing->events->[0]->{description}, '2022-02 Sebring', 'Check description of first race';
}

sub test_parse_events3 {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_3")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 6, "Testing number of events that were parsed";
    is $clubracing->events->[0]->{description}, '2022-04 Heartland', 'Check description of first race';
}

sub test_parse_events4 {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_4")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 20, "Testing number of events that were parsed";
    is $clubracing->events->[0]->{description}, '2022-09 Thunderhill', 'Check description of first race';
}

sub test_parse_events5 {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_5")) ), 'RennPoints::ClubRacing';

    is @{$clubracing->events}, 15, "Testing number of events that were parsed";
    my ( $clubracing_event ) = grep { $_->{description} eq '2023-07 Brainerd' } @{$clubracing->events};

    is $clubracing_event->{description}, '2023-07 Brainerd', 'Check description of second race';
    is @{$clubracing_event->{event}->races}, 3, "Testing number of events that were parsed";

#    my $races = $clubracing_event->{event}->races;

}


sub test_url {
    my $test = shift;

    isa_ok my $clubracing = RennPoints::ClubRacing->new( content => scalar(read_file("test_files/clubracing/clubracing_1")) ), 'RennPoints::ClubRacing';
    ok $clubracing->url, 'test that URL is not null';
}

1;
