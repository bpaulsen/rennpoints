#!/usr/bin/perl -w

use warnings;
use strict;
use CGI;
use DateTime;
use RennPoints::Schema;
use Template;

printPage();

sub printPage {
    my $cgi = new CGI;

    my $year = $cgi->param( "year" ) || getYear();
    my $events = getEvents( $year );

    if ( $cgi->param( "update" ) ) {
	updateEvents( $year, $events );
    }

    my $output;
    my $template = Template->new( RELATIVE => 1 );
    $template->process( 'premiereEvents.html', 
			{ year => $year,
			  EVENTS => $events,
			},
			\$output );

    print $cgi->header;
    print $output;

    return;
}

sub updateEvents {
    my $year = shift;
    my $events = shift;
    my $schema = RennPoints::Schema->connect;

    my $rs = $schema->resultset( 'PremiereEvent' );
    $rs->search( { "year" => $year } )->delete;

    my @newPremiere = grep { $_->event_type >= 2 } @$events;

    foreach my $i ( @newPremiere ) {
	$rs->create( { year => $year,
		       track_id => $i->track_id,
		       event_type => $i->event_type,
		     }
	    );
    }

    return;
}

sub getEvents {
    my $year = shift;
    
    my $searchyear = $year - 1;

    my $schema = RennPoints::Schema->connect;

    my $es = $schema->resultset('Event');
    my $rs = $schema->resultset('Result');
    my @events = $es->search( { "me.date" => { 'between' => [ "$searchyear-01-01", "$searchyear-12-01" ] } },
			      { "+select" => [ $rs->search( { "race.event_id" => { '=' => { -ident => "me.event_id" } } },
							    { "select" => [ { "count" => { "distinct" => "transponder" } } ],
							      alias => 'RESULTS',
							      join => "race",
							    },
					       )->as_query,
					       $es->search( { "PREVEVENT.track_id" => { '=' => { -ident => "me.track_id" } },
							      "YEAR(PREVEVENT.date)" => { '<' => \ 'YEAR(me.date)' } },
							    { alias => "PREVEVENT" },
					       )->count_rs->as_query,
				    ],
				"+as" => [ 'participants', 'previous_events' ],
				prefetch => { "track" => "region" },
			      },
	);

    my %regions = map { $_->track->region_id => 1 } @events;

    my %premiere;
    my @sortedData = grep { $_->get_column('previous_events') > 0 } ( sort { $b->get_column('participants') <=> $a->get_column('participants') } @events );
    
    foreach my $i ( 0..1 ) {   # top 2 attended events are national events
	$premiere{ $sortedData[$i]->track_id } = 3;
    }

    @sortedData = sort { $a->track->region_id <=> $b->track->region_id || $b->get_column('participants') <=> $a->get_column('participants') } @events;
    foreach my $i ( keys %regions ) {
	my @region = grep { $_->track->region_id == $i && !$premiere{$_->track_id} && $_->get_column('previous_events') > 0 } @sortedData;
	$premiere{ $region[0]->track_id } = 2;
    }

    foreach my $i ( @sortedData ) {
	$i->event_type( 1 );
	if ( $premiere{ $i->track_id } ) {
	    $i->event_type( $premiere{ $i->track_id } );
#	    $i->{ type_name } = $i->{type} == 3 ? "National" : "Premiere";
	}
    }

    return \@sortedData;
}

sub getYear {
    my $dt = DateTime->now;

    return $dt->year + ( $dt->month == 12 ? 1 : 0 );
}
