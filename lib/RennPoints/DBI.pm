package RennPoints::DBI;

use strict;
use warnings;
use base qw( Exporter );
use RennPoints::Config;
use DBI;

our @EXPORT_OK = qw( getDBConnection );

sub getDBConnection {
    my $writeable = shift || 0;

    my $config = RennPoints::Config->new( context => 'DBI' );

    my $host = $config->get( 'host' );
    my $dsn = "DBI:mysql:database=clubrace;host=$host;";

    my $authentication = $config->get( $writeable ? "writeable" : "readonly" );
    return DBI->connect($dsn, $authentication->{user}, $authentication->{password} );
}

1;
