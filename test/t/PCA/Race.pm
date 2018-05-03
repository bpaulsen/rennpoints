package TestsFor::RennPoints::PCA::Race;
use Test::Class::Moose;
use RennPoints::PCA::Race;
use File::Basename qw(dirname);

# methods that begin with test_ are test methods.
sub test_parse_html_race {
    my $test = shift;

    my $dir = dirname( $INC{ 'PCA.pm' } );

    isa_ok my $race = RennPoints::PCA::Race->new(url => "file://$dir/PCA/2016-04-LimeRock-PCA-Web.zip",
						 race => '4  Yellow Race Group - Sprint Race 1 - Results.html' ), 'RennPoints::PCA::Race';
    is @{$race->participants}, 25, "Testing number of participants that were parsed";

    is_deeply $race->participants->[0], { laps => 35,
					  region => 'WMI',
					  name => 'CLAUDIO KAEMPF',
					  car_number => 66,
					  description => 'GT 70 911',
					  best_lap_number => 32,
					  class_position => 1,
					  overall_time_difference => undef,
					  overall_position => 1,
					  color => 'BLUE',
					  class => 'GT4',
					  best_time => 56.093,
					  total_time => 2008.998,
                                        }, 'Test structure of first participant';
    is_deeply $race->participants->[1], { laps => 35,
					  region => 'RTR',
					  name => 'JOHN GIANNONE',
					  car_number => '024',
					  description => 'GT 03 996 C2',
					  best_lap_number => 14,
					  class_position => 1,
					  overall_time_difference => '39.515',
					  overall_position => 2,
					  color => 'SILVER',
					  class => 'GTB1',
					  best_time => '57.004',
					  total_time => '2048.513',
                                        }, 'Test structure of second participant';
}

sub test_parse_pdf_race {
    my $test = shift;

    my $dir = dirname( $INC{ 'PCA.pm' } );

    isa_ok my $race = RennPoints::PCA::Race->new(url => "file://$dir/PCA/2017-04-LimeRock-PCA-Web.zip",
						 race => '4  Orange Race Group - Sprint Race 2 - RaceFull.pdf' ), 'RennPoints::PCA::Race';
    is @{$race->participants}, 18, "Testing number of participants that were parsed";

    is_deeply $race->participants->[0], { overall_position => 1,
					  car_number => 118,
					  name => 'JOHN GOETZ',
					  class => 'GTC6',
					  laps => 39,
					  total_time => 2198.543,
					  best_time => 53.557,
					  best_lap_number => 4,
					  color => 'WHITE/RED',
					  description => '15 991 GT3 CUP',
					  region => 'CTV',
                                        }, 'Test structure of first participant';

    is_deeply $race->participants->[1], { overall_position => 2,
					  car_number => 113,
					  name => 'STEVE KATZ',
					  class => 'GTC3',
					  laps => 39,
					  total_time => 2204.115,
					  best_time => 53.741,
					  best_lap_number => 9,
					  color => 'WHITE/RED',
					  description => '05 996 CUP',
					  region => 'MNY',
                                        }, 'Test structure of second participant';

    isa_ok $race = RennPoints::PCA::Race->new(url => "file://$dir/PCA/2017-04-LimeRock-PCA-Web.zip",
					      race => '2  Green Race Group - Sprint Race 2 - RaceFull.pdf' ), 'RennPoints::PCA::Race';
    is @{$race->participants}, 22, "Testing number of participants that were parsed";
    is_deeply $race->participants->[9], { overall_position => 10,
					  car_number => 95,
					  name => 'JOHN KOSTER',
					  class => 'F',
					  laps => 31,
					  total_time => 2013.436,
					  best_time => 62.407,
					  best_lap_number => 13,
					  color => 'RED',
					  description => 'S 01 BOXSTER S',
					  region => 'CTV',
                                        }, 'Test structure of tenth participant';

    isa_ok $race = RennPoints::PCA::Race->new(url => "file://$dir/PCA/2017-02-Sebring-Results-PCA-Web.zip",
					      race => '0. Blue - Sprint Race #2 - RaceFull.pdf' ), 'RennPoints::PCA::Race';
    is @{$race->participants}, 54, "Testing number of participants that were parsed";
    is_deeply $race->participants->[42], { overall_position => 43,
					  car_number => '062',
					  name => 'RICH TILLOTSON',
					  class => 'GTC3',
					  laps => 11,
					  total_time => 1663.951,
					  best_time => 147.721,
					  best_lap_number => 8,
					  color => 'WHITE/RED/YELLOW',
					  description => 'GT 00 GT3 CUP',
					  region => 'SFL',
                                        }, 'Test structure of 43rd participant';

    is_deeply $race->participants->[45], { overall_position => 'DNF',
					  car_number => '125',
					  name => 'ROKKET HORTON',
					  class => 'GTC3',
					  laps => 11,
					  total_time => 1575.798,
					  best_time => 138.692,
					  best_lap_number => 6,
					  color => 'BLUE',
					  description => 'GT 01 996',
					  region => 'SFL',
                                        }, 'Test structure of 46th participant';

    isa_ok $race = RennPoints::PCA::Race->new(url => "file://$dir/PCA/2017-06-MPH-PCA-Web.zip",
					      race => 'RED - SPRINT 2 - RaceFull.pdf' ), 'RennPoints::PCA::Race';
    is @{$race->participants}, 14, "Testing number of participants that were parsed";
    is_deeply $race->participants->[9], { overall_position => 10,
					  car_number => '113',
					  name => 'MICHAEL STEWART',
					  class => 'J',
					  laps => 16,
					  total_time => 1592.09,
					  best_time => 97.65,
					  best_lap_number => undef,
					  color => 'RED/BLUE',
					  description => 'P 05 GT3',
					  region => 'NST',
                                        }, 'Test structure of 10th participant';


}

1;
