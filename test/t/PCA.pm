package TestsFor::RennPoints::PCA;
use Test::Class::Moose;
use RennPoints::PCA;
use File::Basename qw(dirname);
use File::Slurp qw(read_file);

    # methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    my $dir = dirname( $INC{ 'PCA.pm' } );
    $dir .= "/PCA";
    isa_ok my $pca = RennPoints::PCA->new( content => scalar(read_file("test_files/pca/pca_1")), zip_directory => $dir ), 'RennPoints::PCA';
    
    is @{$pca->events}, 214, "Testing number of events that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $pca = RennPoints::PCA->new( content => scalar(read_file("test_files/pca/pca_1")) ), 'RennPoints::PCA';
    ok $pca->url, 'test that URL is not null';
}

1;
