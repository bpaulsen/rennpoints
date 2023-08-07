package RennPoints::MyLaps::Race;

use Moose;
use RennPoints::MyLaps::Unescape qw( unescape );
use RennPoints::MyLaps::ApiKey;
use JSON;

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Int', required => 1 );
has 'participants' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_participants', lazy => 1 );
has 'api_key_name' => ( is => 'ro', isa => 'Str', default => 'EventResults' );

sub _build_participants {
    my $self = shift;

    my $content = $self->content;
    my $json = from_json($self->content);

    my @participants = map { { class                   => $_->{resultClass },
                               overall_position        => $_->{ position },
                               class_position          => $_->{ positionInClass },
                               car_number              => $_->{ startNumber },
                               name                    => $_->{ name },
                               best_time               => bestLapTime($_->{ bestTime }),
                               best_lap_number         => $_->{ bestLap },
                               best_speed              => $_->{ bestSpeed },
                               total_time              => bestLapTime($_->{ totalTime }),
                               laps                    => $_->{ numberOfLaps },
                               status                  => $_->{ status },
                               class_time_difference  => bestLapTime( $_->{ diffClass }->{ timeDifference } ),
                               class_laps_behind      => bestLapTime( $_->{ diffClass }->{ lapsBehind } ),
                               overall_time_difference => bestLapTime( $_->{ difference }->{ timeDifference } ),
                               overall_laps_behind     => bestLapTime( $_->{ difference }->{ lapsBehind } ),
                               transponder             => $_->{ user }->{ chip }->{ code },
                               is_qualified            => $_->{ isQualified } + 0,
                           } } @{$data->{rows}};

    return \@participants;
}

sub _build_url {
    my $self = shift;
    return 'https://eventresults-api.speedhive.com/api/v0.2.3/eventresults/sessions/' . $self->id . '/classification'
}

sub _build_api_key {
    my $self = shift;

    return RennPoints::MyLaps::ApiKey->new( id => $self->api_key_name );
}

sub bestLapTime {
    my $val = shift;

    return 0 if !defined $val;

    return 0 if $val =~ /^\-\-/x;

    my @t = split( /:/x, $val );

    my $time = $t[-1];

    if ( $#t > 0 ) {
	$time += $t[-2] * 60;
    }

    if ( $#t > 1 ) {
	$time += $t[-3] * 3600;
    }

    return $time;
}

__PACKAGE__->meta->make_immutable;
