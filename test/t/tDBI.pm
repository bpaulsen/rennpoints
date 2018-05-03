package TestsFor::RennPoints::DBI;
use Test::Class::Moose;
use RennPoints::DBI;

sub test_writeable {
    my $test = shift;

    isa_ok my $dbh = RennPoints::DBI::getDBConnection( 1 ), 'DBI::db';

    my ( $user ) = $dbh->selectrow_array( "SELECT CURRENT_USER()" );
    like $user, qr/_admin/, 'Test that user ends in _admin';
}

sub test_readable {
    my $test = shift;

    isa_ok my $dbh = RennPoints::DBI::getDBConnection( 0 ), 'DBI::db';

    my ( $user ) = $dbh->selectrow_array( "SELECT CURRENT_USER()" );
    like $user, qr/_read_only/, 'Test that user ends in _read_only';
}

1;
