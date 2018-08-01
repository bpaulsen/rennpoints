package TestsFor::RennPoints::ClubRacing::Event;
use Test::Class::Moose;
use RennPoints::ClubRacing::Event;
use File::Slurp qw(read_file);

# methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRacing::Event->new( content => scalar(read_file("test_files/clubracing/event_1")) ), 'RennPoints::ClubRacing::Event';
    is @{$event->races}, 6, "Testing number of races that were parsed";
    is $event->races->[0], 'http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/RedSprint1.html', 'Check name of first race';

    isa_ok $event = RennPoints::ClubRacing::Event->new( content => scalar(read_file("test_files/clubracing/event_2")) ), 'RennPoints::ClubRacing::Event';
    is @{$event->races}, 11, "Testing number of races that were parsed";
    is $event->races->[10], 'http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/PinkEnduro.html', 'Check name of first race';
}

1;
