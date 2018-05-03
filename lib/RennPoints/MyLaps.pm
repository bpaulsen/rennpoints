package RennPoints::MyLaps;

use Moose;
use RennPoints::MyLaps::Unescape qw( unescape );

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Int', default => 5427 );
has 'events' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_events', lazy => 1 );

sub _build_events {
    my $self = shift;

    my $content = $self->content;
    my @events;
    while ( $content =~ m{<a href="/Events/(\d+)".*?<span class="eventTitle">(.*?)</span>.*?<div class="row-event-date">(.*?)</div>}sgo ) {
        push @events, { id => $1,
                        title => unescape($2),
                        date => formatDate($3),
                    };
    }

    @events = sort { $b->{date} cmp $a->{date} } @events;

    return \@events;
}

sub formatDate {
    my $date = shift;

    my ( $m, $d, $yyyy ) = $date =~ m{(\d+)/(\d+)/(\d+)}x;
    return $date if !$m;

    return sprintf( "%4d-%02d-%02d", $yyyy, $m, $d );
}

sub _build_root_url {
    my $self = shift;
    return $self->_config->get( 'list_events_url' );
}

__PACKAGE__->meta->make_immutable;
