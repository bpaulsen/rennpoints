package TestsFor::RennPoints::PCA::Event;
use Test::Class::Moose;
use RennPoints::PCA::Event;
use File::Basename qw(dirname);

# methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    my $dir = dirname( $INC{ 'PCA.pm' } );

    isa_ok my $event = RennPoints::PCA::Event->new( url => "file://$dir/PCA/2016-04-LimeRock-PCA-Web.zip" ), 'RennPoints::PCA::Event';
    is @{$event->races}, 8, "Testing number of races that were parsed";
    is $event->races->[0], '2  white race group - sprint race 1 - results.html', 'Check name of first race';

    isa_ok $event = RennPoints::PCA::Event->new( url => "file://$dir/PCA/2017-04-LimeRock-PCA-Web.zip" ), 'RennPoints::PCA::Event';
    is @{$event->races}, 8, "Testing number of races that were parsed";
}

1;
