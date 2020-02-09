package TestsFor::RennPoints::ClubRegistration::Event;
use Test::Class::Moose;
use RennPoints::ClubRegistration::Event;
use File::Slurp qw(read_file);

sub test_registration_date {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Event->new( registration_date_content => scalar(read_file("test_files/clubregistration/event_registration_content")),
								 id => 0 ), 'RennPoints::ClubRegistration::Event';
#    ok $event->url, 'test that URL is not null';
    is $event->registration_date, '07/31/17', 'test registration date';
}

sub test_get_races {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Event->new( content => scalar(read_file("test_files/clubregistration/event_1")),
								 id      => 0 ), 'RennPoints::ClubRegistration::Event';
    is_deeply $event->races, [ 16063, 16071 ], 'test races';

    isa_ok $event = RennPoints::ClubRegistration::Event->new( content => scalar(read_file("test_files/clubregistration/event_2")),
							      id      => 0 ), 'RennPoints::ClubRegistration::Event';
    is_deeply $event->races, [ 16002, 16003, 16004, 16005, 16006 ], 'test races';
}

1;
