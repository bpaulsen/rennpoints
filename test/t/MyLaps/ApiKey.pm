package TestsFor::RennPoints::MyLaps::ApiKey;
use Test::Class::Moose;
use RennPoints::MyLaps::ApiKey;

    # methods that begin with test_ are test methods.
sub test_parse_apikey {
    my $test = shift;

    my $content = '{"key":"TempKey-15c4b06a3ba047dcbbb3a61a078b3550","expiry":"2023-08-05T14:34:39.1928344+00:00"}';
    
    isa_ok my $key = RennPoints::MyLaps::ApiKey->new( content => $content, id => 'Test' ), 'RennPoints::MyLaps::ApiKey';
    is $key->content, $content, "Testing content";

    $key->_populate_from_mylaps();
    is $key->key, "TempKey-15c4b06a3ba047dcbbb3a61a078b3550", "Testing key";
    is $key->expiry, 1691246079, "Testing expiry time";
}

sub test_url {
    my $test = shift;

    isa_ok my $key = RennPoints::MyLaps::ApiKey->new( id => "Test" ), 'RennPoints::MyLaps::ApiKey';
    ok $key->url, 'test that URL is not null';
}

1;
