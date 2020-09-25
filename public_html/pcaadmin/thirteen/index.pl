#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use Spreadsheet::Read;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    return $self->tt_process('thirteen.html');
}

sub upload_file : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $filename = $cgi->param( 'racers' );
    my $tmpfilename = $cgi->tmpFileName( $filename );
    my ( $suffix ) = $filename =~ /.*\.([^\.]+)$/x;
    my $ref = ReadData( $tmpfilename, parser => $suffix );

    my ( $firstName, $lastName );
    foreach my $i ( 1 .. 4 ) {
	$firstName = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "fname";
	$lastName  = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "lname";
    }

    my $num_rows = $#{$ref->[1]->{cell}->[1]};
    my @data;

    if ( $firstName && $lastName ) {
	foreach my $i ( 2 .. $num_rows ) {
	    push @data, { first_name => $ref->[1]->{cell}->[$firstName]->[$i],
			  last_name  => $ref->[1]->{cell}->[$lastName]->[$i],
	                };
	}
    }

    my $year = 2013;
    foreach my $i ( @data ) {
	my ($count) = $self->dbh->selectrow_array( "select count(*) from thirteen where first_name = ? and last_name = ? and year = ?", {}, $i->{first_name}, $i->{last_name}, $year );
	if ( $count == 0 ) {
	    $i->{action} = "INSERT";
	    $self->dbh->do( "insert into thirteen ( first_name, last_name, year ) values ( ?, ?, ? )", {}, $i->{first_name}, $i->{last_name}, $year );
	}
    }

    return $self->tt_process('thirteen.html',
			     { DATA => \@data }
 	                    );
}
