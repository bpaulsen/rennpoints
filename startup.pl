#!/usr/bin/perl -w

use warnings;
use strict;
use lib "/var/www/html/rennpoints";
use lib "/var/www/html/rennpoints/lib";
use lib "/usr/local/lib/perl";

use RennPoints::Schema;

$ENV{RENNPOINTS_CONFIG} = "/var/www/html/rennpoints/.rennpoints.cfg";
$ENV{PERL5LIB} = "/var/www/html/rennpoints:/var/www/html/rennpoints/lib:/usr/local/lib/perl";

1;
