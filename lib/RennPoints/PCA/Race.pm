package RennPoints::PCA::Race;

use Moose;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);
use HTML::TableExtract;
use Archive::Zip;
use IO::String;
use File::Temp;

has 'participants' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_participants', lazy => 1 );
has 'url' => ( is => 'ro', isa => 'Maybe[Str]' );
has 'race' => ( is => 'ro', isa => 'Str', required => 1 );
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
    my $string = IO::String->new($self->content);
    my $zip = Archive::Zip->new();
    $zip->readFromFileHandle( $string );

    foreach my $member ( $zip->members ) {
	next if $member->fileName ne $self->race;

	return $self->_parseHTML( $member->contents ) if $self->race =~ /\.html$/;
	return $self->_parsePDFwithXML( $member->contents )  if $self->race =~ /\.pdf$/;
    }
}

sub _parseHTML {
    my $self = shift;
    my $html = shift;

    my $te = HTML::TableExtract->new( headers => [ 'Pos', 'PIC', 'No.', 'Name', 'Class', 'Laps', 'Total Tm', 'Diff', 'Best Tm', 'In Lap', 'Color', 'Description', 'Region' ] );
    $te->parse( $html );
    if ( !$te->tables ) {
	$te = HTML::TableExtract->new( headers => [ 'Pos', 'PIC', 'No.', 'Name', 'Class', 'Laps', 'Total Tm', 'Diff', 'Best Tm', 'In Lap', 'Color', 'Desc', 'Region' ] );
	$te->parse( $html );
    }

    my @participants;
    foreach my $ts ( $te->tables ) {
	foreach my $row ( $ts->rows ) {
	    next if !defined $row->[0];
	    my ( $pos, $pic, $car_num, $name, $class, $laps, $total_time, $diff, $best_time, $best_lap, $color, $description, $region ) = @$row;

	    push @participants, { overall_position => $pos,
				  class_position   => $pic,
				  car_number       => $car_num,
				  name             => $name,
				  class            => $class,
				  laps             => $laps,
				  total_time       => bestLapTime($total_time),
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

sub _parsePDF {
    my $self = shift;
    my $pdf = shift;

    my $tmpfile = File::Temp->new( SUFFIX => '.pdf' );
    print $tmpfile $pdf;

    my $filename = $tmpfile->filename;
    my $converted_text = `/usr/bin/pdftohtml $filename -i -stdout`;
    
    my @text = split /\n/, $converted_text;
    foreach my $row ( @text ) {
	$row =~ s/&nbsp;<br>$//;
	$row =~ s/&nbsp;/ /g;
    }

    shift @text while ( $text[0] !~ /^<b>Pos/ );  # remove all the lines up to the result header;
    pop @text while ( $text[-1] !~ /^<b>Margin of Victory / ); # remove all lines after result footer;
    pop @text;

    my @headers;
    foreach my $row ( @text ) {
	my ( $header ) = $row =~ m{^<b>(.*) </b><br>$};
	if ( $header ) {
	    if ( $header eq "No.  Name" ) {
		push @headers, "No.";
		push @headers, "Name";
	    }
	    else {
		push @headers, $header;
	    }
	}
    }

    my @participants;

    # need to handle first row specially because the diff column does not exist for the race leader
    my $pos = $#headers;
    my %result = ( Diff => undef );
    foreach my $header ( @headers ) {
	if ( $header ne 'Diff' ) {
	    $result{$header} = $text[$pos++];
	}
    }
    push @participants, \%result;

    for ( my $i = $pos; $i < @text; $i += @headers ) {
	my %result;
	@result{@headers} = @text[$i .. $i + $#headers ];
	push @participants, \%result;
    }

    my @result_set = map { { overall_position => $_->{ 'Pos' },
			     car_number       => $_->{ 'No.' },
			     name             => $_->{ Name },
			     class            => $_->{ Class },
			     laps             => $_->{ Laps },
			     total_time       => bestLapTime($_->{ 'Total Tm' }),
			     best_time        => bestLapTime($_->{ 'Best Tm' }),
			     best_lap_number  => $_->{ 'In Lap' },
			     color            => $_->{ Color },
			     region           => $_->{ Region },
			     description      => $_->{ Description },
                         } } @participants;

    return \@result_set;
}

sub _parsePDFwithXML {
    my $self = shift;
    my $pdf = shift;

    my $tmpfile = File::Temp->new( SUFFIX => '.pdf' );
    print $tmpfile $pdf;

    my $filename = $tmpfile->filename;
    my $converted_text = `/usr/bin/pdftohtml $filename -xml -i -stdout`;

    my @participants;
    foreach my $page ( $converted_text =~ m{<page number(.*?)<b>Sorted on Laps}sg ) {
	my $key;
	my $key_row;
	my $previous_offset = 0;
	my $previous_row = 0;
	my $not_classified_offset = 0;
	my $not_classified_row = 0;
	my @results;
	while ( $page =~ m{<text top="(\d+)".*?>(.*?)</text>}og ) {
	    my $row = $1;
	    my $text = $2;

	    if ( $text =~ m{<b>(.*) </b>} ) {
		$key = $1;
		$key_row = $row;
		$previous_offset = -1;
	    }
	    elsif ( $text =~ m{Not\s+classified} ) {
		$not_classified_row = int( ( $row - $key_row ) / 16.5 + 0.5) - 1;
		$not_classified_offset = $not_classified_row - $previous_offset;
		$previous_offset = $previous_offset + int( ( $row - $previous_row ) / 16.5 + 0.5);
	    }
	    else {
		$text =~ s/\s+$//;
		# my $offset = int( ( $row - $key_row ) / 16.5 + 0.5) - 1;
		my $offset = $previous_offset + int( ( $row - $previous_row ) / 16.5 + 0.5);
		$previous_offset = $offset;
		# $offset -= $not_classified_offset if $offset > $not_classified_row;
		$results[$offset]->{ $key } = $text if !$results[$offset]->{ $key }
	    }
	    $previous_row = $row;
	}
	push @participants, @results;
    }

    @participants = grep { $_->{Name} } @participants;

    my @result_set = map { { overall_position => $_->{ 'Pos' },
			     car_number       => $_->{ 'No.' },
			     name             => $_->{ Name },
			     class            => $_->{ Class },
			     laps             => $_->{ Laps },
			     total_time       => bestLapTime($_->{ 'Total Tm' }),
			     best_time        => bestLapTime($_->{ 'Best Tm' }),
			     best_lap_number  => $_->{ 'In Lap' },
			     color            => parseColor( $_->{ Color } ),
			     region           => $_->{ Region },
			     description      => $_->{ Description } || $_->{ Desc },
                         } } @participants;

    return \@result_set;
}

sub parseColor {
    my $color = shift;
    return $color if !$color;

    $color =~ s/\s//g;
    return $color;
}

sub _parsePage {
    my $self = shift;
    my $txt = shift;
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
