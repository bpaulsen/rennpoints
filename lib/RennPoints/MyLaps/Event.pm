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
    foreach my $session ( @group_html[1..$#group_html] ) {
        my ( $group ) = $session =~ m{<div class="row-session-title">\s+<h3>(.*?)</h3>}go;
        $group =~ s/^\d+:\s+//o;

        while ( $session =~ m{<a href="/Sessions/(\d+)".*?<span class="ico ico-(.*?)"></span>.*?<div class="row-event-name">(.*?)</div>.*?<div class="row-event-date">(\d+)\s*(\w\w\w)</div>.*?<div class="row-event-time">(.*?)</div>}sgo ) {
	    next if $2 eq 'qualify-merge';

            push @sessions, { id => $1,
			      type => $2,
			      group => $group,
                              session => join( " - ", $group, $3 ),
                              datetime => join( " ", join( "-", $year, $MONTHS{$5}, $4 ), $6 ),
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
