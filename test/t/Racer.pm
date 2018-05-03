package TestsFor::RennPoints::Racer;
use Test::Class::Moose;
use RennPoints::Racer;
use RennPoints::DBI qw( getDBConnection );
use Data::Dumper;

sub test_parse_clubreg_name {
    my $test = shift;
    my $racers = [ { clubreg_name => 'Adams, Don', given_name => 'Don', surname => 'Adams', suffix => '' },
		   { clubreg_name => 'Albani, Jr., Attilio', given_name => 'Attilio', surname => 'Albani', suffix => 'Jr' },
		   { clubreg_name => 'Collins Jr., E.Thomas', given_name => 'Thomas', surname => 'Collins', suffix => 'Jr' },
		   { clubreg_name => 'Hauck, III, Andrew', given_name => 'Andrew', surname => 'Hauck', suffix => 'III' },
		   { clubreg_name => 'JACOBI, BILL', given_name => 'Bill', surname => 'Jacobi', suffix => '' },
		   { clubreg_name => 'LaHaye, Jr, Philip W', given_name => 'Philip', surname => 'LaHaye', suffix => 'Jr' },
		   { clubreg_name => 'Lloyd, william', given_name => 'William', surname => 'Lloyd', suffix => '' },
		   { clubreg_name => 'Viau, Bob JR', given_name => 'Bob', surname => 'Viau', suffix => 'Jr' },
		   { clubreg_name => 'Mineau, Ed', given_name => 'Ed', surname => 'Mineau', suffix => '' },
		   { clubreg_name => 'Westberg, Nils.A.', given_name => 'Nils', surname => 'Westberg', suffix => '' },
		   { clubreg_name => 'Stupakoff, Victor (bico)', given_name => 'Victor', surname => 'Stupakoff', suffix => '' },
		   { clubreg_name => 'Mitchell, R.L.', given_name => 'R.L.', surname => 'Mitchell', suffix => '' },
		   { clubreg_name => 'St. Denis, Brian', given_name => 'Brian', surname => 'St. Denis', suffix => '' },
		   { clubreg_name => 'Hess, Al', given_name => 'Al', surname => 'Hess', suffix => '' },
		   { clubreg_name => 'Mineau, Ed', given_name => 'Ed', surname => 'Mineau', suffix => '' },
		   { clubreg_name => 'Lippman, Cyrus (Charlie)', given_name => 'Cyrus', surname => 'Lippman', suffix => '' },
#		   { clubreg_name => '', given_name => '', surname => '', suffix => '' },
	];

    #my $dbh = getDBConnection();
    #$racers = $dbh->selectall_arrayref( "SELECT surname, givenname AS 'given_name', clubreg_name FROM racer LIMIT 601, 1000", { Slice => {} } );

    foreach my $racer ( @$racers ) {
	my $parse = RennPoints::Racer::_parse_name( $racer->{ clubreg_name } );
	is $parse->{surname}, $racer->{surname}, "Testing surname parse of '$racer->{clubreg_name}'";
	is $parse->{given_name}, $racer->{given_name}, "Testing given name parse of '$racer->{clubreg_name}'";
	# is $parse->{suffix}, $racer->{suffix}, "Testing suffix parse of '$racer->{clubreg_name}'";
    }
}

1;
