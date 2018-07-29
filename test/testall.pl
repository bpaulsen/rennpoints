#!/usr/bin/perl -w

use File::Spec qw(rel2abs);
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use Test::Class::Moose::Load File::Spec->catfile( dirname(abs_path($0)), 't' );
use Test::Class::Moose::Runner;

Test::Class::Moose::Runner->new(test_classes => \@ARGV)->runtests;
