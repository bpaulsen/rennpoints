package RennPoints::ClubRegistration::Event;

use Moose;
use RennPoints::ClubRegistration::Race;
use HTML::Form;
use HTTP::Request::Common qw(GET);

with 'RennPoints::ClubRegistration::LWP';

has 'id' => ( is => 'ro', isa => 'Int', required => 1 );
has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );
has 'registration_date' => ( is => 'ro', isa => 'Str', builder => '_build_registration_date', lazy => 1 );
has 'registration_date_content' => ( is => 'ro', isa => 'Str', builder => '_build_registration_date_content', lazy => 1 );
has 'participants' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_participants', lazy => 1 );

sub _build_content {
    my $self = shift;

    my $url = $self->_root_url . "/events/roster.cfm?event_id=" . $self->id;
    my $response = $self->ua->request( GET $url );
    return if !$response->is_success;
    return $response->content;
}

sub _build_races {
    my $self = shift;

    my ( $form ) = HTML::Form->parse( $self->content, $self->_root_url );
    my $viewOption = $form->find_input( "viewOption" );
    return [] if !$viewOption || !$viewOption->value_names;

    my @results;
    foreach my $name ( $viewOption->value_names() ) {
	next unless $name =~ /(sprint|enduro|Race|primary\s+driver\s+weekend\s+package|Weekend\s+event\s+fee)/ix;
	$viewOption->value($name);
	my $value = $viewOption->value();
	push @results, $value;
    }

    return \@results;
}

sub _build_registration_date_content {
    my $self = shift;

    my $response = $self->ua->request( GET $self->_root_url . "/events/event-details.cfm?event_id=" . $self->id );
    return if !$response->is_success;

    return $response->content;
}

sub _build_registration_date {
    my $self = shift;

    my ( $registration ) = $self->registration_date_content() =~ m{Registration\sDates.*?(\d\d/\d\d/\d\d)}xs;
    return $registration;
}

sub _build_participants {
    my $self = shift;

    my @racers;
    foreach my $id ( @{$self->races} ) {
	my $race = RennPoints::ClubRegistration::Race->new( ua => $self->ua, id => $id );
	my $participants = $race->participants;
	push @racers, @$participants if @$participants > 0;
    }

    return \@racers;
}

__PACKAGE__->meta->make_immutable;
