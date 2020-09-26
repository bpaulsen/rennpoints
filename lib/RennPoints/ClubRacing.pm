package RennPoints::ClubRacing;

use Moose;
use LWP::UserAgent;
use RennPoints::ClubRacing::Event;
use HTTP::Request::Common qw(GET);
use RennPoints::Config;

has 'events' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_events', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_content', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Str', builder => '_build_url', lazy => 1 );
has 'ua' => ( is => 'ro', builder => '_build_ua', lazy => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );

my %MONTHS = ( Jan => "01", Feb => "02", Mar => "03", Apr => "04", May => "05", Jun => "06",
               Jul => "07", Aug => "08", Sep => "09", Oct => "10", Nov => "11", Dec => "12",
           );

my $DEFAULT_UA;

sub _build_ua {
    my $self = shift;

    if ( !$DEFAULT_UA ) {
        $DEFAULT_UA = LWP::UserAgent->new();
    }

    return $DEFAULT_UA;
}

sub _build_config {
    my $self = shift;
    return RennPoints::Config->new( context => 'ClubRacing' );
}

sub _build_url {
    my $self = shift;
    return $self->_config->get( 'url' );
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

    my @events;

    my $content = $self->content;

    if ( $content ) {
        while ( $content =~ m{div id="Results-([^"]+)".*?<h1.*?>([^<]+).*?<p.*?>([^<]+)}sgp ) {
            my ( $track, $name, $date, $data ) = ( $1, $2, $3, ${^POSTMATCH} );

            $data =~ s/<div id="Results.*//s;

            my ( $month, $year ) = $date =~ m{^(...).*, (\d+)$};
            push @events, { track => $track,
                            name => $name,
                            description => "$year-$MONTHS{$month} $track",
                            date => $date,
                            event => RennPoints::ClubRacing::Event->new( content => $data ),
	    };
        }
    }

    return \@events;
}

__PACKAGE__->meta->make_immutable;
