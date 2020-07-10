package RennPoints::ClubRegistration;

use Moose;
use RennPoints::ClubRegistration::Event;
use HTTP::Request::Common qw(GET POST);

with 'RennPoints::ClubRegistration::LWP';

has 'debug' => ( is => 'rw', isa => 'Bool', default => 0 );
has 'retrieve_registration_dates' => ( is => 'rw', isa => 'Bool', default => 1 );
has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );

sub _build_content {
    my $self = shift;
    my $ua = $self->ua;

    my $url = $self->_root_url . "/events/event-search.cfm";
    print STDERR "URL = $url\n" if $self->debug;
    my $req = POST $url,
    eventTypeSelected => "Club Race";

    my $response = $ua->request( $req );
    return if !$response->is_success;

    return $response->content;
}

sub _build_races {
    my $self = shift;

    my $content = $self->content;

    my @results;
    while ( $content =~ m{<table>
                            .*?<td.*?>\s*Host.*?<td.*?>(.*?)</td>
                            .*?<td.*?>\s*Name.*?<td.*?>(.*?)</td>
                            .*?Dates.*?(\d\d/\d\d/\d\d)-(\d\d/\d\d/\d\d)
                            .*?Event\sType.*?Club\sRace
                            .*?Location.*?<td.*?>(.*?)</td>
                            .*?Registrar.*?<a\shref.*?>(.*?)</a>
                            .*?eventRoster\((\d+)\)
                         }sgx ) {
        my $match = { HOST => $1,
                      NAME => $2,
                      STARTDATE => $3,
                      ENDDATE => $4,
                      LOCATION => $5,
                      REGISTRAR => $6,
                      ID => $7,
        };

	$match->{HOST} =~ s/^\s*(.*?)\s*$/$1/gxo;
	$match->{LOCATION} =~ s/^\s*(.*?)\s*$/$1/gxo;
	$match->{LOCATION} =~ s{^<a\s+href.*?>(.*?)</a>}{$1}gxo;
	print STDERR "'$match->{HOST}' '$match->{NAME}' '$match->{STARTDATE}' '$match->{ENDDATE}' '$match->{LOCATION}' '$match->{REGISTRAR}' '$match->{ID}'\n" if $self->debug;

        next unless $match->{REGISTRAR} =~ /pca\.org/i;

	if ( $match->{NAME} =~ /cancel/ixo ) {
	    $match->{CANCELLED} = 1;
	}
	
        $match->{LOCATION} =~ s/–/-/gxo;
        $match->{NAME} =~ s/–/-/gxo;

        my $parse = $self->_parseLocation( $match->{LOCATION} );
        $match->{TRACKNAME} = $parse->{name};
        $match->{CITY} = $parse->{city};
        $match->{STATE} = $parse->{state};

        $match->{NAME} =~ s/–/-/gxo;
        $parse = $self->_parseLocation( $match->{NAME} );
        $match->{CITY} = $parse->{city} if !$match->{CITY};
        $match->{STATE} = $parse->{state} if !$match->{STATE};

        delete $match->{NAME};
        delete $match->{HOST};
        delete $match->{REGISTRAR};

        push @results, $match;
    }

    if ( $self->retrieve_registration_dates ) {
        foreach my $i ( @results ) {
	    next if $i->{CANCELLED};
            $i->{REGISTRATION} = RennPoints::ClubRegistration::Event->new( id => $i->{ID} )->registration_date;
        }
    }

    return \@results;
}

sub _parseLocation {
    my $self = shift;
    my $location = shift;

    $location =~ s/–/-/gxo;

    my ( $beginning, $state ) = $location =~ m{(.*),\s+(\w\w)\s*$}xo;
    my ( $name, $city ) = $beginning =~ m{(.*)[\-,](.*)$}xo if $beginning;

    $name =~ s/\s*$//xo if $name;
    $city =~ s/^[\s\-]+//xo if $city;
    return { name => $name || $beginning || $location,
             city => $city,
             state => $state,
    };
}

__PACKAGE__->meta->make_immutable;
