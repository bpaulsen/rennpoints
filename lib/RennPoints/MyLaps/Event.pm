package RennPoints::MyLaps::Event;

use Moose;
use JSON;
use RennPoints::MyLaps::ApiKey;

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Int', required => 1 );
has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );
has 'api_key_name' => ( is => 'ro', isa => 'Str', default => 'EventResults' );

my %MONTHS = ( Jan => "01", Feb => "02", Mar => "03", Apr => "04", May => "05", Jun => "06",
               Jul => "07", Aug => "08", Sep => "09", Oct => "10", Nov => "11", Dec => "12",
           );

sub _build_races {
    my $self = shift;

    my $json = from_json($self->content);
    
    my @sessions;

    foreach my $group ( @{$json->{sessions}->{groups}} ) {
	foreach my $session ( @{$group->{sessions}} ) {
	    next if $session->{isMerge};
	    my $id = $session->{id};
	    my $type = $session->{type};
	    my $group_name = $session->{groupName};
	    my $name = $session->{name};
	    $name =~ s/\s+$//;
	    my $datetime = $session->{startTime};
	    $datetime =~ s/T/ /;
	    
            push @sessions, { id => $id,
			      type => $type,
			      group => $group_name,
                              session => join( " - ", $group_name, $name ),
                              datetime => $datetime,
	                    };
	}
    }

    return \@sessions;
}

sub _build_url {
    my $self = shift;
    return 'https://eventresults-api.speedhive.com/api/v0.2.3/eventresults/events/' . $self->id . '?sessions=true'
}

sub _build_api_key {
    my $self = shift;

    return RennPoints::MyLaps::ApiKey->new( id => $self->api_key_name );
}

__PACKAGE__->meta->make_immutable;
