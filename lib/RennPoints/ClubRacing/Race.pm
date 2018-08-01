package RennPoints::ClubRacing::Race;

use Moose;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);
use HTML::TableExtract;

has 'participants' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_participants', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Maybe[Str]' );
has 'content' => ( is => 'ro', isa => 'Maybe[Str]', builder => '_build_content', lazy => 1 );

sub _build_content {
    my $self = shift;

    my $ua = LWP::UserAgent->new();
    my $response = $ua->request( GET $self->url );
    return if !$response->is_success;
    return $response->content;
}

sub _build_participants {
    my $self = shift;
    my $content = $self->content;

#    my $te = HTML::TableExtract->new( headers => [ 'Pos', 'PIC', 'No.', 'Name', 'Class', 'Laps', 'Diff', 'Gap', 'Best Tm', 'In Lap', 'Description', 'Color', 'Region' ],
    my $te = HTML::TableExtract->new( headers => [ 'Pos', 'PIC', 'No.', 'Name', 'Class', 'Region' ],
				      slice_columns => 0,
	                            );
    $te->parse( $content );

    my @participants;
    foreach my $ts ( $te->tables ) {
	my %headers = create_header_map( $ts->hrow );
	foreach my $row ( $ts->rows ) {
	    next if !defined $row->[0];

	    push @participants, { overall_position => get_column(\%headers, $row, 'Pos' ),
				  class_position   => get_column(\%headers, $row, 'PIC' ),
				  car_number       => get_column(\%headers, $row, 'No.' ),
				  name             => get_column(\%headers, $row, 'Name' ),
				  class            => get_column(\%headers, $row, 'Class' ),
				  laps             => get_column(\%headers, $row, 'Laps' ),
				  overall_time_difference => bestLapTime( get_column(\%headers, $row, 'Diff' ) ),
				  best_time        => bestLapTime( get_column(\%headers, $row, 'Best Tm' ) ),
				  best_lap_number  => get_column(\%headers, $row, 'In Lap' ),
				  color            => get_column(\%headers, $row, 'Color' ),
				  description      => get_column(\%headers, $row, 'Description' ),
				  region           => get_column(\%headers, $row, 'Region' ),
	    };
	}
    }

    return \@participants;
}

sub get_column {
    my $map = shift;
    my $row = shift;
    my @fields = @_;

    foreach my $field ( @fields ) {
	if ( exists($map->{$field}) ) {
	    return $row->[$map->{$field}];
	}
    }

    return undef;
}

sub create_header_map {
    my @headers = @_;

    my %map;
    my $count = 0;
    foreach my $header ( @headers ) {
	$map{$header} = $count++;
    }

    return %map;
}

sub bestLapTime {
    my $val = shift;

    return 0 if !defined $val;
    $val =~ s/^\s+//;
    $val =~ s/\s+$//;
    return 0 if !defined($val);

    return 0 if $val =~ /^\-\-/x;

    my @t = split( /:/x, $val );

    my $time = $t[-1];

    if ( $#t > 0 ) {
	$time += $t[-2] * 60;
    }

    if ( $#t > 1 ) {
	$time += $t[-3] * 3600;
    }

    return $time;
}

__PACKAGE__->meta->make_immutable;
