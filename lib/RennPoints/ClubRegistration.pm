package RennPoints::ClubRegistration;

use Moose;
use RennPoints::ClubRegistration::Event;
use HTML::Form;
use HTTP::Request::Common qw(GET POST);
use JSON;

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
                            .*?Location.*?<a\shref.*?>(.*?)</a>
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

	print STDERR "'$match->{HOST}' '$match->{NAME}' '$match->{STARTDATE}' '$match->{ENDDATE}' '$match->{LOCATION}' '$match->{REGISTRAR}' '$match->{ID}'\n" if $self->debug;

        next unless $match->{REGISTRAR} =~ /pca\.org/i;

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
            $i->{REGISTRATION} = RennPoints::ClubRegistration::Event->new( id => $i->{ID} )->registration_date;
        }
    }

    return \@results;
}

sub participants {
    my $self = shift;
    my $id = shift;

    my $ua = $self->ua;

    my $url = $self->_root_url . "/events/roster.cfm?event_id=$id";
    print STDERR "URL = $url\n" if $self->debug;
    my $response = $ua->request( GET $url );

    my ( $form ) = HTML::Form->parse( $response );
    my $viewOption = $form->find_input( "viewOption" );

    my @results;
    foreach my $name ( $viewOption->value_names() ) {
	print STDERR "name = $name\n" if $self->debug;
        next unless $name =~ /(sprint|spriint|sholar|enduro|Race|primary\s+driver\s+weekend\s+package)/ix;
        $viewOption->value($name);
        my $value = $viewOption->value();

        my $newUrl = $self->_root_url . "/events/rosterOptions.json.cfm?viewOption=$value";
        print STDERR "Name=$name URL = $newUrl\n" if $self->debug;

        $response = $ua->request( GET $newUrl );
        my $data = from_json( $response->content );

        push @results, $data->{aaData};
    }

    _deSpacify( \@results );

    my @racers;
    foreach my $result ( @results ) {
        foreach my $racer ( @$result ) {
            my $name = $racer->[0];
            my $car = $racer->[1];
            my $full_class = $racer->[2];
            my $pca_race = $racer->[3];
            my $number = $racer->[4];

            next if !$name;
            next if $name eq "Shire, Susan";
            next if $name =~ /Wait\s+List/ix;

            my $type = "";
            $type = "Stock" if $full_class =~ /Stock/x;
            $type = "Prepared" if $full_class =~ /Prepared/x;
            $full_class =~ s/\s(\d+)$/$1/x;
            $full_class =~ s/^(?:GT|Stock|Prepared|Modified|Spec|GTC)\s+//x;
            $full_class =~ s/^GT\-/GT/x;
            $full_class =~ s/^\s*\-\s*//x;
            my ( $class ) = $full_class =~ /^(\w+)/x;
            next if !$class;

            $car =~ s/P[o0]rsche\s*//xi;
            $car =~ s/P[o0]rchse\s*//xi;
            $car =~ s/Boxter/Boxster/xi;
            if ( length($class) == 1 ) {
                $car = $type . " " . $car;
            }
            push @racers, { name => $name,
                            car => $car,
                            class => $class,
                            race => $pca_race,
                            number => $number,
            }
        }
    }

    return @racers;
}

sub _deSpacify {
    my $array = shift;

    foreach my $i ( @$array ) {
        if ( !ref($i) ) {
            $i =~ s/^\s+//x;
            $i =~ s/\s+$//x;
            $i =~ s/\s+/ /gx;
            $i =~ s/^Stock\s\-/Stock/x;
            $i =~ s/^Prepared\s\-/Prepared/x;
            $i =~ s/&nbsp\;<a.*//x;
        }

        if ( ref( $i ) eq "ARRAY" ) {
            _deSpacify( $i );
        }
    }

    return;
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
