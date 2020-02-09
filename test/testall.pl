#!/usr/bin/perl -w

use lib "../lib";
use File::Spec qw(rel2abs);
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use Test::Class::Moose::Load File::Spec->catfile( dirname(abs_path($0)), 't' );
use Test::Class::Moose::Runner;

# example argument to pass in : TestsFor::RennPoints::ClubRegistration
Test::Class::Moose::Runner->new(test_classes => \@ARGV)->runtests;
