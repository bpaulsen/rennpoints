#!/usr/bin/perl

use strict;
use warnings;
use base 'CGI::Application';
use CGI::Application::Plugin::TT;
use CGI::Application::Plugin::AutoRunmode;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;

    return $self->tt_process('splash.html');
}
