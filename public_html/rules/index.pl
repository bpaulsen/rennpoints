#!/usr/bin/perl

use strict;
use warnings;
use Template;
use CGI;

printPage();

sub printPage {
    my $cgi = new CGI;

    my $output;
    my $template = Template->new( RELATIVE => 1 );
    $template->process( 'rules.html', 
			{},
			\$output );

    print $cgi->header;
    print $output;
    return;
}
