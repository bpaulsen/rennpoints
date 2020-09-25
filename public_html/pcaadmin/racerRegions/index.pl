#!/usr/bin/perl -w

use warnings;
use strict;
use base 'CGIBase';
use Spreadsheet::Read;

__PACKAGE__->new()->run();

sub main_page : StartRunmode {
    my $self = shift;
    my $cgi = $self->query;

    return $self->tt_process('racerRegions.html');
}

sub upload_file : Runmode {
    my $self = shift;
    my $cgi = $self->query;

    my $filename = $cgi->param( 'racers' );
    my $tmpfilename = $cgi->tmpFileName( $filename );
    my ( $suffix ) = $filename =~ /.*\.([^\.]+)$/x;
    my $ref = ReadData( $tmpfilename, parser => $suffix );

    my ( $firstName, $lastName, $zone, $region );
    foreach my $i ( 1 .. 4 ) {
	$firstName = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "fname";
	$lastName  = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "lname";
	$zone      = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "zone";
	$region    = $i if lc($ref->[1]->{cell}->[$i]->[1]) eq "region";
    }

    my $num_rows = $#{$ref->[1]->{cell}->[1]};
    my @data;

    if ( $firstName && $lastName && $zone && $region ) {
	foreach my $i ( 2 .. $num_rows ) {
	    push @data, { first_name => $ref->[1]->{cell}->[$firstName]->[$i],
			  last_name  => $ref->[1]->{cell}->[$lastName]->[$i],
			  zone       => $ref->[1]->{cell}->[$zone]->[$i],
			  region     => $ref->[1]->{cell}->[$region]->[$i],
	                };
	}
    }

    my $year = 2012;
    foreach my $i ( @data ) {
	my ($count) = $self->dbh->selectrow_array( "select count(*) from racer_regions where first_name = ? and last_name = ? and year = ?", {}, $i->{first_name}, $i->{last_name}, $year );
	if ( $count == 0 ) {
	    $i->{action} = "INSERT";
	    $self->dbh->do( "insert into racer_regions ( first_name, last_name, zone, region, year ) values ( ?, ?, ?, ?, ? )", {}, $i->{first_name}, $i->{last_name}, $i->{zone}, $i->{region}, $year );
	}
	else {
	    ($count) = $self->dbh->selectrow_array( "select count(*) from racer_regions where first_name = ? and last_name = ? and region = ? and zone = ? and year = ?", {}, $i->{first_name}, $i->{last_name}, $i->{region}, $i->{zone}, $year );
	    if ( !$count ) {
		$i->{action} = "UPDATE";
		$self->dbh->do( "update racer_regions set zone = ? and region = ? where first_name = ? and last_name = ? and year = ?", {}, $i->{zone}, $i->{region}, $i->{first_name}, $i->{last_name}, $year );
	    }
	}
    }

    return $self->tt_process('racerRegions.html',
			     { DATA => \@data }
 	                    );
}
