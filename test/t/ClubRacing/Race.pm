package TestsFor::RennPoints::ClubRacing::Race;
use Test::Class::Moose;
use RennPoints::ClubRacing::Race;
use File::Slurp qw(read_file);

# methods that begin with test_ are test methods.
sub test_parse_html_race {
    my $test = shift;

    isa_ok my $race = RennPoints::ClubRacing::Race->new(content => scalar(read_file("test_files/clubracing/race_1"))), 'RennPoints::ClubRacing::Race';
    is @{$race->participants}, 44, "Testing number of participants that were parsed";

    is_deeply $race->participants->[0], { laps => 12,
                                          region => 'NNJ',
                                          name => 'RICK DeMAN',
                                          car_number => 72,
                                          description => '16 CAYMAN GT4',
                                          best_lap_number => 3,
                                          class_position => 1,
                                          overall_time_difference => undef,
                                          overall_position => 1,
                                          color => 'BLACK',
                                          class => 'GTB3',
                                          best_time => 135.522
                                        }, 'Test structure of first participant';
    is_deeply $race->participants->[1], { laps => 12,
                                          region => 'NNJ',
                                          name => 'LINCOLN LLOPIZ',
                                          car_number => 121,
                                          description => '16 CAYMAN GT4CS',
                                          best_lap_number => 2,
                                          class_position => 1,
                                          overall_time_difference => 3.462,
                                          overall_position => 2,
                                          color => 'WHITE',
                                          class => 'GTD',
                                          best_time => 136.719
                                        }, 'Test structure of second participant';
}

sub test_parse_html_race_with_fewer_columns {
    my $test = shift;

    isa_ok my $race = RennPoints::ClubRacing::Race->new(content => scalar(read_file("test_files/clubracing/race_2"))), 'RennPoints::ClubRacing::Race';
    is @{$race->participants}, 33, "Testing number of participants that were parsed";

    is_deeply $race->participants->[0], { laps => 15,
                                          region => 'NST',
                                          name => 'MIKE COURTNEY',
                                          car_number => 87,
                                          description => '06 997 CUP',
                                          best_lap_number => 15,
                                          class_position => 1,
                                          overall_time_difference => undef,
                                          overall_position => 1,
                                          color => undef,
                                          class => 'GTC4',
                                          best_time => 101.05
                                        }, 'Test structure of first participant';


}

1;
