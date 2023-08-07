package TestsFor::RennPoints::MyLaps::Race;
use Test::Class::Moose;
use RennPoints::MyLaps::Race;
use File::Slurp qw(read_file);

    # methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $race = RennPoints::MyLaps::Race->new( content => scalar(read_file("test_files/mylaps/race_1")), id => 0 ), 'RennPoints::MyLaps::Race';
    is @{$race->participants}, 48, "Testing number of participants that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $race = RennPoints::MyLaps::Race->new( content => scalar(read_file("test_files/mylaps/race_1")), id => 0 ), 'RennPoints::MyLaps::Race';
    ok $race->url, 'test that URL is not null';
}

1;
