package RennPoints::MyLaps::Unescape;

use base qw( Exporter );
use strict;
use warnings;
use HTML::Entities;

our @EXPORT_OK = qw( unescape );

sub unescape {
    my $str = shift;

    $str =~ s/–/-/go;
    $str =~ s/\&amp\;/&/go;
    $str =~ s/&#160\;/ /go;
    $str =~ s/&#246\;/o/go;
    $str = decode_entities( $str );
    return $str;
}

1;

