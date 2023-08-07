package RennPoints::MyLaps;

use Moose;
use RennPoints::MyLaps::Unescape qw( unescape );
use RennPoints::MyLaps::ApiKey;
use Date::Parse qw(strptime);
use JSON;

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Int', default => 5427 );
has 'events' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_events', lazy => 1 );
has 'api_key_name' => ( is => 'ro', isa => 'Str', default => 'EventResults' );

sub _build_events {
    my $self = shift;

    my $json = from_json($self->content);

    local $_;
    my @events = map { { id                  => $_->{ id },
			 title               => $_->{ name },
			 date                => formatDate( $_->{startDate} ),
			 updated             => $_->{updatedAt},
			 mylaps_track_id     => $_->{location}->{id},
			 mylaps_track_name   => $_->{location}->{name},
			 mylaps_track_length => $_->{location}->{length},
	               }
                     } @$json;

    return \@events;
    @events = sort { $b->{date} cmp $a->{date} || $a->{mylaps_track_name} cmp $b->{mylaps_track_name} } @events;

    return \@events;
}

sub formatDate {
    my $date = shift;

    if ( 1 ) {
	my @time = strptime $date;
	if (@time) {
	    return sprintf( "%4d-%02d-%02d", 1900 + $time[5], 1 + $time[4], $time[3] );
	}
    }
    
    my ( $m, $d, $yyyy ) = $date =~ m{(\d+)/(\d+)/(\d+)}x;
    return $date if !$m;

    return sprintf( "%4d-%02d-%02d", $yyyy, $m, $d );
}

sub _build_url {
    return 'https://eventresults-api.speedhive.com/api/v0.2.3/eventresults/organizations/5427/events?count=25&offset=0&sportCategory=Motorized';
}

sub _build_api_key {
    my $self = shift;

    return RennPoints::MyLaps::ApiKey->new( id => $self->api_key_name );
}

__PACKAGE__->meta->make_immutable;
