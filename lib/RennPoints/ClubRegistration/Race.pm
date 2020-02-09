package RennPoints::ClubRegistration::Race;

use Moose;
use HTTP::Request::Common qw(GET);
use JSON;

with 'RennPoints::ClubRegistration::LWP';

has 'id' => ( is => 'ro', isa => 'Int', required => 1 );
has 'participants' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_participants', lazy => 1 );

sub _build_content {
    my $self = shift;

    my $url = $self->_root_url . "/events/rosterOptions.json.cfm?viewOption=" . $self->id;
    my $response = $self->ua->request( GET $url );
    return if !$response->is_success;
    return $response->content;
}

sub _build_participants {
    my $self = shift;

    my @results = from_json( $self->content )->{aaData};

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

    return \@racers;
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

__PACKAGE__->meta->make_immutable;
