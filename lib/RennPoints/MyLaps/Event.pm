package RennPoints::MyLaps::Event;

use Moose;

with 'RennPoints::MyLaps::LWP';

has 'id' => ( is => 'ro', isa => 'Int', required => 1 );
has 'races' => ( is => 'ro', isa => 'ArrayRef', builder => '_build_races', lazy => 1 );

my %MONTHS = ( Jan => "01", Feb => "02", Mar => "03", Apr => "04", May => "05", Jun => "06",
               Jul => "07", Aug => "08", Sep => "09", Oct => "10", Nov => "11", Dec => "12",
           );

sub _build_races {
    my $self = shift;

    my $content = $self->content;

    my ( $year ) = $content =~ m{<div class="race-date">.*?\s(\d+)</div>};

    my @sessions;
    my @group_html = split /<div class="row-event">/, $content;
    shift @group_html;
    foreach my $group ( @group_html ) {
        my ( $group_name ) = $group =~ m{<div class="row-session-title">\s+<h3>(.*?)</h3>}go;
        $group_name =~ s/^\d+:\s+//o;

	foreach my $session ( split /<\/a>/, $group ) {
	    my ($id) = $session =~ m{"/Sessions/(\d+)"}sgo;
	    next if !$id;

	    my ($type) = $session =~ m{span\s+class="ico\s+ico-(.*?)">};
	    next if $type eq 'qualify-merge';

	    my ($name) = $session =~ m{<div class="row-event-name">(.*?)</div>}sgo;
	    my ($day, $month ) = $session =~ m{<div class="row-event-date">(\d+)\s*(\w{3})</div>}sgo;
	    my ($time ) = $session =~ m{<div class="row-event-time">(.*?)</div>}sgo;

            push @sessions, { id => $id,
			      type => $type,
			      group => $group_name,
                              session => join( " - ", $group_name, $name ),
                              datetime => join( " ", join( "-", $year, $MONTHS{$month}, $day ), $time ),
	                    };
	}
    }

    return \@sessions;
}

sub _build_root_url {
    my $self = shift;
    return $self->_config->get( 'list_races_url' );
}

__PACKAGE__->meta->make_immutable;
