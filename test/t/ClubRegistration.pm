package TestsFor::RennPoints::ClubRegistration;
use Test::Class::Moose;
use RennPoints::ClubRegistration;
use File::Slurp qw(read_file);

# Watkins Glen International - Watkins Glen, NY
# Gateway Motorsports Park - Madison, IL
# Mid-Ohio Sports Car Course – Lexington, OH
# Lime Rock Park - Lakeville, CT
# Auto Club Speedway - Fontana, CA
# Mazda Raceway Laguna Seca, Salinas, CA

    # methods that begin with test_ are test methods.
sub test_parseLocation {
    my $test = shift;

    isa_ok my $clubreg = RennPoints::ClubRegistration->new(), 'RennPoints::ClubRegistration';

    my $location = "Watkins Glen International - Watkins Glen, NY";
    my $ref = $clubreg->_parseLocation( $location );
    is $ref->{name}, 'Watkins Glen International', "Testing parsing of name for '$location'";
    is $ref->{city}, 'Watkins Glen', "Testing parsing of city for '$location'";
    is $ref->{state}, 'NY', "Testing parsing of state for '$location'";

    $location = "Mid-Ohio Sports Car Course – Lexington, OH";
    $ref = $clubreg->_parseLocation( $location );
    is $ref->{name}, 'Mid-Ohio Sports Car Course', "Testing parsing of name for '$location'";
    is $ref->{city}, 'Lexington', "Testing parsing of city for '$location'";
    is $ref->{state}, 'OH', "Testing parsing of state for '$location'";

    $location = "Mazda Raceway Laguna Seca, Salinas, CA";
    $ref = $clubreg->_parseLocation( $location );
    is $ref->{name}, 'Mazda Raceway Laguna Seca', "Testing parsing of name for '$location'";
    is $ref->{city}, 'Salinas', "Testing parsing of city for '$location'";
    is $ref->{state}, 'CA', "Testing parsing of state for '$location'";
}

sub test_parseRaces {
    my $test = shift;

    isa_ok my $clubreg = RennPoints::ClubRegistration->new( content => scalar(read_file("test_files/clubregistration/clubregistration_1")),
							    retrieve_registration_dates => 0 ), 
    'RennPoints::ClubRegistration';
    is @{$clubreg->races}, 4, "Testing number of races that were parsed";

    is_deeply $clubreg->races->[0], { 'ID' => '8530',
				      'LOCATION' => 'Pittsburgh International Race Complex',
				      'CITY' => 'Wampum',
				      'TRACKNAME' => 'Pittsburgh International Race Complex',
				      'ENDDATE' => '10/15/17',
				      'STARTDATE' => '10/13/17',
				      'STATE' => 'PA'
                                    }, 'Test structure of first race'
}

sub test_parseRaces2 {
    my $test = shift;

    isa_ok my $clubreg = RennPoints::ClubRegistration->new( content => scalar(read_file("test_files/clubregistration/clubregistration_2")),
							    retrieve_registration_dates => 0 ), 
    'RennPoints::ClubRegistration';
    is @{$clubreg->races}, 4, "Testing number of races that were parsed";

    is_deeply $clubreg->races->[0], { 'ID' => '10448',
				      'LOCATION' => 'Circuit of the Americas (COTA) - Austin, TX',
				      'CITY' => 'Austin',
				      'TRACKNAME' => 'Circuit of the Americas (COTA)',
				      'STARTDATE' => '02/28/20',
				      'ENDDATE' => '03/01/20',
				      'STATE' => 'TX'
                                    }, 'Test structure of first race'
}

sub test_parseRaces3 {
    my $test = shift;

    isa_ok my $clubreg = RennPoints::ClubRegistration->new( content => scalar(read_file("test_files/clubregistration/clubregistration_3")),
							    retrieve_registration_dates => 0 ), 
    'RennPoints::ClubRegistration';
    is @{$clubreg->races}, 24, "Testing number of races that were parsed";

    is_deeply $clubreg->races->[0], { 'TRACKNAME' => 'Lime Rock Park',
				      'LOCATION' => 'Lime Rock Park - Lakeville, CT',
				      'ID' => '10526',
				      'CITY' => 'Lakeville',
				      'CANCELLED' => 1,
				      'ENDDATE' => '04/25/20',
				      'STARTDATE' => '04/24/20',
				      'STATE' => 'CT'
                                    }, 'Test structure of first race'
}

sub test_parseRaces4 {
    my $test = shift;

    isa_ok my $clubreg = RennPoints::ClubRegistration->new( content => scalar(read_file("test_files/clubregistration/clubregistration_4")),
							    retrieve_registration_dates => 0,
	                                                  ), 
    'RennPoints::ClubRegistration';
    is @{$clubreg->races}, 16, "Testing number of races that were parsed";

    is_deeply $clubreg->races->[0], { 'TRACKNAME' => 'Brainerd International Raceway',
				      'LOCATION' => 'Brainerd International Raceway - Brainerd, MN',
				      'ID' => '10623',
				      'CITY' => 'Brainerd',
				      'ENDDATE' => '07/26/20',
				      'STARTDATE' => '07/25/20',
				      'STATE' => 'MN'
    }, 'Test structure of first race';

}

1;
