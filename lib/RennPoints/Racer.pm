package RennPoints::Racer;

use Moose;
use RennPoints::DBI qw( getDBConnection );
use Lingua::EN::NameCase qw(nc);

has 'dbh' => ( is => 'ro', builder => '_dbh', lazy => 1 );
has 'id' => ( is => 'rw', isa => 'Int', builder => '_build_id', lazy => 1 );
has 'clubreg_name' => ( is => 'ro', isa => 'Str', lazy => 1, default => 'foo' );
has 'surname' => ( is => 'ro', isa => 'Str', builder => '_build_surname', lazy => 1 );
has 'given_name' => ( is => 'ro', isa => 'Str', builder => '_build_given_name', lazy => 1 );

my %CAPITALIZATIONS = ( "lahaye" => "LaHaye",
			"van zelst" => "Van Zelst",
			"rj" => "RJ",
			"bj" => "BJ",
			"kc" => "KC",
			"mccue" => "Mccue",
			"deguire" => "DeGuire",
		      );
sub _build_id {
    my $self = shift;
    my $dbh = $self->dbh();

    my ( $id ) = $dbh->selectrow_array( "SELECT racer_id FROM racer WHERE clubreg_name = ?", {}, $self->clubreg_name );

    if ( !$id ) {
#	$dbh->do( "INSERT racer ( clubreg_name, surname, givenname ) VALUES ( ?, ?, ? )", {}, $racer, $surname, $givenname );
#	( $id ) = $dbh->selectrow_array( "SELECT racer_id FROM racer WHERE clubreg_name = ?", {}, $racer );
    }

    return $id;
}

sub _build_dbh {
    my $self = shift;

    return getDBConnection( 1 );
}

sub _fix_capitalization {
    my $name = shift;

    my $adjusted = nc($name);
    $adjusted = ucfirst(lc($adjusted)) if length($adjusted) == 2;

    $adjusted = $CAPITALIZATIONS{lc($adjusted)} || $adjusted;

    return $adjusted;
}

sub _parse_name {
    my $full_name = shift;
    my @names = split /,/, $full_name;
    $names[-1] =~ s/^\s\w\.(\w\w\w+)$/ $1/xo;
    $names[-1] =~ s/^\s+//xo;
    $names[-1] =~ s/\s+\(.*\)//xo;

    $names[0] =~ s/\s (?:jr|iii|iv)\.?$//xoi;  # remove suffixes
    $names[-1] =~ s/\s (?:jr|iii|iv)\.?$//xoi;
    $names[-1] =~ s/^(\w+)\s\w\.?$/$1/xo;
    $names[-1] =~ s/^(\w\w+)\.\w\.$/$1/xo;

    return { surname => _fix_capitalization($names[0]),
	     given_name => _fix_capitalization($names[-1]),
    };
}

__PACKAGE__->meta->make_immutable;
