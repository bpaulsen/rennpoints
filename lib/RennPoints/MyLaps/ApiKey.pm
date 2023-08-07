package RennPoints::MyLaps::ApiKey;

use Moose;
use RennPoints::DBI qw(getDBConnection);
use Time::Local qw(timegm);
use JSON;

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Str', required => 1 );
has 'expiry' => ( is => 'rw', default => 0, isa => 'Int' );

has '_key' => ( is => 'rw', default => '', isa => 'Str' );
has '_dbh' => ( is => 'ro', builder => '_build_dbh', lazy => 1 );

sub key {
    my $self = shift;

    if ( $self->expiry < time ) {
	$self->_populate_from_db();
	
	if ( $self->expiry < time ) {
	    $self->_populate_from_mylaps();
	    if ( $self->expiry > time ) {
		$self->_persist();
	    }
	}
    }

    return $self->_key;
}

sub _build_api_key {
    return;
}

sub _build_dbh {
    return getDBConnection(1);
}

sub _populate_from_db {
    my $self = shift;

    my ( $key, $expiry ) = $self->_dbh->selectrow_array("SELECT apikey, UNIX_TIMESTAMP(expiry) FROM mylaps_apikey WHERE id = ? AND expiry > NOW()", {}, $self->id );
    if ( $key && $expiry && $expiry > scalar(gmtime()) ) {
	$self->_key($key);
	$self->expiry($expiry);
    }
}

sub _populate_from_mylaps {
    my $self = shift;

    my $content = $self->content();
    if ( $content ) {
	my $json = from_json($content);
	my $expiry_string = $json->{expiry};
	my ( $y, $m, $d, $h, $mm, $s ) = $expiry_string =~ /^(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)/;
	my $expiry = timegm( $s, $mm, $h, $d, $m - 1, $y - 1900);

	$self->_key($json->{key});
	$self->expiry($expiry);
    }
}

sub _persist {
    my $self = shift;

    $self->_dbh->do( "INSERT INTO mylaps_apikey( id, apikey, expiry ) VALUES ( ?, ?, FROM_UNIXTIME(?) ) ON DUPLICATE KEY UPDATE apikey = ?, expiry = FROM_UNIXTIME(?)", {},
		    $self->id, $self->key, $self->expiry, $self->key, $self->expiry );
}

sub _build_root_url {
    my $self = shift;
    return $self->_config->get( 'api_key_url' );
}

__PACKAGE__->meta->make_immutable;
