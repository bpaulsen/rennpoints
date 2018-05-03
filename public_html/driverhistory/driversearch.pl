#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( searchForRacer );
use CGI;
use JSON;

printPage();

sub printPage {
    my $cgi = new CGI;

    my $term = $cgi->param("term");
    my $results = searchForRacer( SEARCH => $term );
    my @results = map { $_->{ fullname } } @$results;

    print $cgi->header();
    print encode_json( \@results );

    return;
}
