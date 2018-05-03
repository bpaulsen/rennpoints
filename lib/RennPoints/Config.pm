package RennPoints::Config;

use Moose;
use Config::General;

has 'context' => ( is => 'ro', isa => 'Str', required => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );
has '_config_file' => ( is => 'ro', isa => 'Str', default => $ENV{RENNPOINTS_CONFIG} );

my $ALL_CONFIG;

sub get {
    my $self = shift;
    my $attribute = shift;

    return $self->_config->{ $self->context }->{ $attribute };
}

sub _build_config {
    my $self = shift;

    if ( !$ALL_CONFIG ) {
        my $config = Config::General->new( $self->_config_file );
        $ALL_CONFIG = { $config->getall() };
    }

    return $ALL_CONFIG;
}

__PACKAGE__->meta->make_immutable;
