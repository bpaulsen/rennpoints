#!/usr/bin/perl -w

use warnings;
use strict;
use RennPoints qw( getDBConnection getAllClassRecords getLapTimePrediction formatTime insertRacerIntoDB );
use LWP::UserAgent;
use HTTP::Cookies;
use HTML::Form;
use HTTP::Request::Common qw(GET);
use Data::Dumper;
use Storable;
use JSON;
use IO::Socket::SSL qw();

IO::Socket::SSL::set_ctx_defaults(
     SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE,
    );

my $id = shift;
my $DEBUG = 1;
my $BASEURL = "https://clubregistration.net";

my $dbh = getDBConnection();
my $upcomingEvents = $dbh->selectall_arrayref( "SELECT * from clubreg_urls WHERE end_date >= CURDATE() AND registration <= CURDATE()", {Slice => {} } );

foreach my $i ( @$upcomingEvents ) {
    next if $id && $id != $i->{clubreg_id};
    my $url = "$BASEURL/events/roster.cfm?event_id=$i->{clubreg_id}";

    my @races = getRaces( $url );

    if ( @races ) {
	my $file = "clubreg/$i->{clubreg_id}.racers";
	store \@races, $file;
    }
}

sub getRaces {
    my $url = shift;

    my $ua = LWP::UserAgent->new( ssl_opts => { verify_hostname => 0,
					       SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE,
				 } );

    my $cookiejar = HTTP::Cookies->new();
    $ua->cookie_jar( $cookiejar );

    my $response = $ua->request( GET $BASEURL );
    my ( $form ) = HTML::Form->parse( $response );

    $form->param( "username" => "*******" );
    $form->param( "password" => "*******" );
    my $tmp_response = $ua->request( $form->click( "btn_login" ) );
    # print $tmp_response->as_string, "\n";

    print STDERR "URL = $url\n";
    my $response = $ua->request( GET $url );

    my ( $form ) = HTML::Form->parse( $response );
    my $viewOption = $form->find_input( "viewOption" );

    my @results;
    foreach my $name ( $viewOption->value_names() ) {
	next unless $name =~ /(sprint|enduro|Race|primary\s+driver\s+weekend\s+package)/ix;
	$viewOption->value($name);
	my $value = $viewOption->value();

	my $newUrl = "$BASEURL/events/rosterOptions.json.cfm?viewOption=$value";

	print STDERR "URL = $newUrl\n" if $DEBUG;

	$response = $ua->request( GET $newUrl );
	print $response->as_string, "\n";
	my $data = from_json( $response->content );

	push @results, $data->{aaData};
    }

    deSpacify( \@results );
    print STDERR Dumper( \@results );
    return @results;
}

sub deSpacify {
    my $array = shift;

    foreach my $i ( @$array ) {
	if ( !ref($i) ) {
	    $i =~ s/^\s+//x;
	    $i =~ s/\s+$//x;
	    $i =~ s/\s+/ /gx;
	    $i =~ s/^Stock\s\-/Stock/x;
	    $i =~ s/^Prepared\s\-/Prepared/x;
	}
	    
	if ( ref( $i ) eq "ARRAY" ) {
	    deSpacify( $i );
	}
    }

    return;
}
