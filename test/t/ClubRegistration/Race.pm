package TestsFor::RennPoints::ClubRegistration::Race;
use Test::Class::Moose;
use RennPoints::ClubRegistration::Race;
use File::Slurp qw(read_file);

sub test_participants {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Race->new( content => scalar(read_file("test_files/clubregistration/race_1")),
								id => 0 ), 'RennPoints::ClubRegistration::Race';
    is @{$event->participants}, 106, 'test number of participants';
    is_deeply $event->participants->[0], { 'number' => '98',
					   'race' => 'BLUE Sprint',
					   'car' => 'Boxster (1997 White)',
					   'name' => 'Hoeh, Henry',
					   'class' => 'SPB'
    }, 'test structure of first participant';

    isa_ok $event = RennPoints::ClubRegistration::Race->new( content => scalar(read_file("test_files/clubregistration/race_2")),
							     id => 0 ), 'RennPoints::ClubRegistration::Race';
    is @{$event->participants}, 87, 'test number of participants';
    is_deeply $event->participants->[0], { 'number' => '124',
					   'race' => 'Unassigned',
					   'car' => '991.1 Cup (2016 White)',
					   'name' => 'Dias Perera, Anton',
					   'class' => 'GTC6'
    }, 'test structure of first participant';
}

1;
