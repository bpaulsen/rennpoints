package RennPoints::ClubRegistration::LWP;

use Moose::Role;
use LWP::UserAgent;
use HTML::Form;
use HTTP::Cookies;
use HTTP::Request::Common qw(GET);
use RennPoints::Config;

has 'ua' => ( is => 'ro', builder => '_build_ua', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Str', builder => '_build_content', lazy => 1 );
#has 'url' => ( is => 'ro', isa => 'Str', builder => '_build_url', lazy => 1 );
has 'username' => ( is => 'ro', isa => 'Str', builder => '_build_user', lazy => 1 );
has 'password' => ( is => 'ro', isa => 'Str', builder => '_build_password', lazy => 1 );
has '_root_url' => ( is => 'ro', isa => 'Str', builder => '_build_root_url', lazy => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );

my $DEFAULT_UA;
my $ua_age = 0;

sub _build_ua {
    my $self = shift;

    if ( !$DEFAULT_UA || (time - $ua_age > 600) ) {
        $DEFAULT_UA = LWP::UserAgent->new();
        my $cookiejar = HTTP::Cookies->new();
        $DEFAULT_UA->cookie_jar( $cookiejar );

	my $response = $DEFAULT_UA->request( GET $self->_root_url );
	my ( $form ) = HTML::Form->parse( $response );

	$form->param( "username" => $self->username );
	$form->param( "password" => $self->password );
	$DEFAULT_UA->request( $form->click( "btn_login" ) );
	$ua_age = time;
    }

    return $DEFAULT_UA;
}

sub _build_user {
    my $self = shift;
    return $self->_config->get( 'user' );
}

sub _build_password {
    my $self = shift;
    return $self->_config->get( 'password' );
}

sub _build_root_url {
    my $self = shift;
    return $self->_config->get( 'url' );
}

sub _build_config {
    my $self = shift;
    return RennPoints::Config->new( context => 'ClubRegistration' );
}

1;
