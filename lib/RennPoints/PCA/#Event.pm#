package RennPoints::PCA::Event;

use Moose;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);
use Archive::Zip;
use IO::String;

has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Str', required => 1 );
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
    my $string = IO::String->new($self->content);
    my $zip = Archive::Zip->new();
    $zip->readFromFileHandle( $string );

    my @races;
    foreach my $member ( $zip->members ) {
	push @races, $member->fileName;
    }

    return \@races;
}

__PACKAGE__->meta->make_immutable;
