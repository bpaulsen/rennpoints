#!/usr/bin/perl

use strict;
use warnings;
use base 'CGIBase';

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;

    return $self->tt_process('splash.html');
}
