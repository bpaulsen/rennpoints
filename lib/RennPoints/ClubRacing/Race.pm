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

    my $te = HTML::TableExtract->new( headers => [ 'Pos', 'PIC', 'No.', 'Name', 'Class', 'Laps', 'Diff', 'Gap', 'Best Tm', 'In Lap', 'Description', 'Color', 'Region' ] );
    $te->parse( $content );

    my @participants;
    foreach my $ts ( $te->tables ) {
	foreach my $row ( $ts->rows ) {
	    next if !defined $row->[0];
	    my ( $pos, $pic, $car_num, $name, $class, $laps, $diff, $gap, $best_time, $best_lap, $description, $color, $region ) = @$row;

	    push @participants, { overall_position => $pos,
				  class_position   => $pic,
				  car_number       => $car_num,
				  name             => $name,
				  class            => $class,
				  laps             => $laps,
				  overall_time_difference => bestLapTime( $diff ),
				  best_time        => bestLapTime($best_time),
				  best_lap_number  => $best_lap,
				  color            => $color,
				  description      => $description,
				  region           => $region,
	    };
	}
    }

    return \@participants;
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
