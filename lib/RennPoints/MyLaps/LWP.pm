package RennPoints::MyLaps::LWP;

use Moose::Role;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request::Common qw(GET);
use RennPoints::Config;

has 'ua' => ( is => 'ro', builder => '_build_ua', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Str', builder => '_build_content', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Str', builder => '_build_url', lazy => 1 );
has 'api_key' => ( is => 'ro', builder => '_build_api_key', lazy => 1 );
has '_root_url' => ( is => 'ro', isa => 'Str', builder => '_build_root_url', lazy => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );

my $DEFAULT_UA;

sub _build_ua {
    my $self = shift;

    if ( 1 || !$DEFAULT_UA ) {
        $DEFAULT_UA = LWP::UserAgent->new();
        my $cookiejar = HTTP::Cookies->new();
        $DEFAULT_UA->cookie_jar( $cookiejar );
        $DEFAULT_UA->agent( "Mozilla/5.0" );
    }

    return $DEFAULT_UA;
}

sub _build_config {
    my $self = shift;
    return RennPoints::Config->new( context => 'MyLaps' );
}

sub _build_url {
    my $self = shift;

    return $self->_root_url . $self->id;
}

sub _build_content {
    my $self = shift;

    my $ua = $self->ua;

    my %headers = ( 'Origin' => 'https://beta.speedhive.com' );

    my $key = $self->api_key;
    if ( $key ) {
	$headers{ApiKey} = $key->key;
    }

    my $response = $ua->request( GET $self->url,
				 %headers
	                       );
    return if !$response->is_success;

    return $response->content;
}

1;

