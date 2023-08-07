package RennPoints::ClubRacing;

use Moose;
use LWP::UserAgent;
use RennPoints::ClubRacing::Event;
use HTTP::Request::Common qw(GET);
use RennPoints::Config;

has 'events' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_events', lazy => 1 );
has 'content' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_content', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Str', builder => '_build_url', lazy => 1 );
has 'ua' => ( is => 'ro', builder => '_build_ua', lazy => 1 );
has '_config' => ( is => 'ro', builder => '_build_config', lazy => 1 );

my %MONTHS = ( Jan => "01", Feb => "02", Mar => "03", Apr => "04", May => "05", Jun => "06",
               Jul => "07", Aug => "08", Sep => "09", Oct => "10", Nov => "11", Dec => "12",
	       January => "01", February => "02", March => "03", April => "04", June => "06",
	       July => "07", August => "08", September => "09", October => "10",
	       November => "11", December => "12"
           );

my $DEFAULT_UA;

sub _build_ua {
    my $self = shift;

    if ( !$DEFAULT_UA ) {
        $DEFAULT_UA = LWP::UserAgent->new();
    }

    return $DEFAULT_UA;
}

sub _build_config {
    my $self = shift;
    return RennPoints::Config->new( context => 'ClubRacing' );
}

sub _build_url {
    my $self = shift;
    return $self->_config->get( 'url' );
}

sub _build_content {
    my $self = shift;

    my $ua = $self->ua;
    my $response = $ua->request( GET $self->url );
    return if !$response->is_success;

    return $response->content;
}

sub _build_events {
    my $self = shift;

    my @events;

    my $content = $self->content;

    if ( $content ) {
	# sample data
	# <div id="Results-COTA" class="et_pb_section et_pb_section_2 et_section_regular">
	# <h1 style="text-align: center;">Carrera of the Americas</h1>
	# <p style="text-align: center;">Mar 02-04, 2018</p>
	#
	# sample hash results
	# 'date' => 'Mar 02-04, 2018',
        # 'track' => 'COTA',
        # 'name' => 'Carrera of the Americas',
	# "description' => '2018-03 COTA'
        while ( $content =~ m{div id="Results-([^"]+)".*?<h1.*?>([^<]+).*?<p.*?>([^<]+)}sgp ) {
            my ( $track, $name, $date, $data ) = ( $1, $2, $3, ${^POSTMATCH} );

            $data =~ s/<div id="Results.*//s;

            my ( $month, $year ) = $date =~ m{^(...).*, (\d+)$};
            push @events, { track => $track,
                            name => $name,
                            description => "$year-$MONTHS{$month} $track",
                            date => $date,
                            event => RennPoints::ClubRacing::Event->new( content => $data ),
	    };
        }

	# this is for 2022 change in website
	# sample data
	# <div class="et_pb_text_inner"><h1 style="text-align: center;">48 Hours @ Sebring</h1>
	# <p style="text-align: center;"> February 04, 2022</p>
	#
	# sample hash results
	# 'date' => 'February 04, 2022',
        # 'track' => 'Sebring',
        # 'name' => '48 Hours @ Sebring',
	# "description' => '2022-02 Sebring'

	if ( !@events ) {
	    my @tmpTracks = grep { $_ =~ m{https://pcaclubracing.org/results/#} } split( /\n/, $content );
	    my %trackMap;
	    foreach my $row ( @tmpTracks ) {
		my ( $anchor, $trackName ) = $row =~ m{href="https://pcaclubracing.org/results/#([^"]+)".*>(.*?)</a>};
		$trackName =~ s/ \(.*\)$//;
		$anchor =~ s/Thunderhill/Thunder/;
		$trackMap{$anchor} = $trackName;
	    }

	    while ( $content =~ m{<div id="([^"]+)" class="et_pb_section.*?"}sgp ) {
		my ( $anchor, $data ) = ( $1, ${^POSTMATCH} );
		$data =~ s/<div id=".*//s;

		my ( $name ) = $data =~ m{<h1.*?>(.*?)</h1>};
		next if !$name;
		my $track = $trackMap{$anchor};
		$data =~ s/ //g;
 		my ( $date ) = $data =~ m{<p style="text-align: center;">(.*?)</p>};
		my ( $month, $day, $year ) = $date =~ m{^(\S+)\s*(\d+),\s*(\d+)};

		push @events, { track => $track,
				name => $name,
				description => "$year-$MONTHS{$month} $track",
				date => $date,
				event => RennPoints::ClubRacing::Event->new( content => $data ),
		              };
	    }
	}
	
	if ( !@events ) {
#	    my @tmpEvents = split /<div id="([^"]+)" class="et_pb_section et_pb_section_26 et_section_regular" >.*/sp, $content;
	    my @tmpEvents = split /<div class="et_pb_text_inner"><h1 style/s, $content;
	    foreach my $data ( @tmpEvents ) {
		my ( $name ) = $data =~ m{>(.*?)</h1>};
		next if !$name;
		my ( $track ) = $name =~ /@ (.*)/;
		$data =~ s/ //g;
 		my ( $date ) = $data =~ m{<p style="text-align: center;">(.*?)</p>};

		my ( $month, $day, $year ) = $date =~ m{^(\S+)\s*(\d+),\s*(\d+)};
		push @events, { track => $track,
				name => $name,
				description => "$year-$MONTHS{$month} $track",
				date => $date,
				event => RennPoints::ClubRacing::Event->new( content => $data ),
		};
	    }
	}
    }

    return \@events;
}

__PACKAGE__->meta->make_immutable;
