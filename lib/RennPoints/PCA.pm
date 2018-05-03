package RennPoints::PCA;

use Moose;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);
use HTTP::Cookies;
use HTML::LinkExtractor;
use RennPoints::Config;
use File::Basename qw(basename);

has 'events' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_events', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_content', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Str', builder => '_build_url', lazy => 1 );
has 'ua' => ( is => 'ro', builder => '_build_ua', lazy => 1 );
has 'zip_directory' => ( is => 'ro', builder => '_build_zip_directory', lazy => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );

my $DEFAULT_UA;

sub _build_ua {
    my $self = shift;

    if ( !$DEFAULT_UA ) {
        $DEFAULT_UA = LWP::UserAgent->new();
        my $cookiejar = HTTP::Cookies->new();
        $DEFAULT_UA->cookie_jar( $cookiejar );
        $DEFAULT_UA->agent( "Mozilla/5.0" );
    }

    return $DEFAULT_UA;
}

sub _build_config {
    my $self = shift;
    return RennPoints::Config->new( context => 'PCA' );
}

sub _build_url {
    my $self = shift;
    return $self->_config->get( 'url' );
}

sub _build_zip_directory {
    my $self = shift;
    return $self->_config->get( 'zip_directory' );
}

sub _build_content {
    my $self = shift;

    my $ua = $self->ua;
    my $response = $ua->request( GET $self->url );
    return if !$response->is_success;

    return $response->content;
}

sub _build_events {
    my $self = shift;

    my @pca;

    my $content = $self->content;

    if ( $content ) {
        my $race_files_base = $self->_config->get( 'race_files_base' );
        my $LX = new HTML::LinkExtractor(undef, $self->_config->get( 'base' ) );
        $LX->parse(\$content);

        foreach my $i ( @{$LX->links} ) {
            next unless $i->{href} && $i->{href} =~ m{^$race_files_base}x;

            my ( $text ) = $i->{_TEXT} =~ m{>(.*?)</a>}x;
            my ( $month, $year, $description ) = $text =~ m{(\d+)/(\d+)\s+-\s+(.*)}x;
            push @pca, { url => $i->{href}->as_string,
                         description => "$year-$month : $description",
                     };
        }
    }

    my $zip_directory = $self->zip_directory;
    foreach my $file ( reverse glob( "$zip_directory/*.zip" ) ) {
	my $text = basename $file;
	next if $text !~ m{^20[012]\d}x;

	push @pca, { url => "file://$file",
		     description => $text,
	};
    }

    return \@pca;
}

__PACKAGE__->meta->make_immutable;
