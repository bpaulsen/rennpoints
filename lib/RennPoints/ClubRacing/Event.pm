package RennPoints::ClubRacing::Event;

use Moose;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);

has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_content', lazy => 1 );

sub _build_content {
    my $self = shift;

    my $ua = LWP::UserAgent->new();
    my $response = $ua->request( GET $self->url );
    return if !$response->is_success;
    return $response->content;
}

sub _build_races {
    my $self = shift;

    my $content = $self->content;
    my @races;
    while ( $content =~ m{<a href="(.*?/uploads/results/[^"]+)[^>]+([^<]+)}sg ) {
        my ( $href, $name ) = ( $1, $2 );
        $name =~ s/\&\#8211\;/-/g;

        push @races, $href;
    }

    return \@races;
}

__PACKAGE__->meta->make_immutable;
