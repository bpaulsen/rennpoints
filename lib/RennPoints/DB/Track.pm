package RennPoints::DB::Track;

use Moose;
use RennPoints::DBI qw( getDBConnection );

has 'dbh' => ( is => 'ro', builder => '_build_dbh', lazy => 1 );
has 'id' => ( is => 'ro', isa => 'Maybe[Int]', builder => '_build_id', predicate => 'has_id', lazy => 1 );
has 'name' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_name', lazy => 1 );
has 'city' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_city', lazy => 1 );
has 'state' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_state', lazy => 1 );
has 'event_count' => ( is => 'ro', isa => 'Int', builder => '_build_event_count', lazy => 1 );
has 'track_list' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_track_list', lazy => 1 );

# the below are for internal methods
has '_track_alias' => ( is => 'ro', isa => 'HashRef', builder => '_build_track_alias', lazy => 1 );
has '_track_map' => ( is => 'ro', isa => 'HashRef', builder => '_build_track_map', lazy => 1 );

my @TRACK_LIST;
my %TRACK_MAP;
my %TRACK_ALIAS;

sub _build_id {
    my $self = shift;

    my $city = $self->city || "";
    my $state = $self->state || "";
    my $name = lc($self->name || "");
    my ( $track ) = grep{ ( !$city || $_->{ city } eq $city ) 
			  && ( !$state || $_->{ state } eq $state )
			  && ( !$name || $_->{ lc_name } eq $name )
                        } @{$self->track_list};
    return $track->{track_id} if $track;

    ( $track ) = grep{ $_->{ lc_name } eq $name } @{$self->track_list};
    return $track->{track_id} if $track;

    my $track_alias = $self->_track_alias;
    return $track_alias->{$name} if exists $track_alias->{$name};

    return;
}

sub _build_city { 
    my $self = shift;

    return if !$self->has_id;
    return $self->_track_map->{ $self->id }->{ city };
}

sub _build_state { 
    my $self = shift;

    return if !$self->has_id;
    return $self->_track_map->{ $self->id }->{ state };
}

sub _build_event_count { 
    my $self = shift;

    return $self->_track_map->{ $self->id }->{ event_count } || 0;
}

sub _build_track_list {
    my $self = shift;

    if ( !@TRACK_LIST ) {
	my $list = $self->dbh->selectall_arrayref( "select track_id, name, city, state, ( select count(*) from event e where e.track_id = t.track_id) AS 'event_count' from track t", { Slice => {} } );
	foreach my $track ( @$list ) {
	    $track->{ city } ||= "";
	    $track->{ state } ||= "";
	    $track->{ lc_name } = lc $track->{name};
	}
	@TRACK_LIST = @$list;
    }

    return \@TRACK_LIST;
}

sub _build_track_map {
    my $self = shift;

    if ( !%TRACK_MAP ) {
	%TRACK_MAP = map { $_->{track_id} => $_ } @{$self->track_list};
    }

    return \%TRACK_MAP;
}

sub _build_track_alias {
    my $self = shift;

    if ( !%TRACK_ALIAS ) {
	my $list = $self->dbh->selectall_arrayref( "select track_id, name from track_alias", { Slice => {} } );
	%TRACK_ALIAS = map { $_->{name} => $_->{track_id} } @$list;
	%TRACK_ALIAS = map { lc($_->{name}) => $_->{track_id} } @$list;
    }

    return \%TRACK_ALIAS;
}

sub _build_dbh {
    my $self = shift;

    return getDBConnection();
}

__PACKAGE__->meta->make_immutable;
