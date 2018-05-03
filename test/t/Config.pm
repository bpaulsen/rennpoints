package TestsFor::RennPoints::Config;
use Test::Class::Moose;
use RennPoints::Config;

sub test_get {
    my $test = shift;

    isa_ok my $config = RennPoints::Config->new( context => 'ClubRegistration' ), 'RennPoints::Config';

    ok $config->get( "user" ), 'Test that user is not null';
}

sub test_get_complex_structure {
    my $test = shift;

    isa_ok my $config = RennPoints::Config->new( context => 'DBI' ), 'RennPoints::Config';
    ok $config->get( "readonly" )->{user}, 'Test that user is not null';
}

1;
