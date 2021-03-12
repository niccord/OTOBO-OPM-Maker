#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use OTOBO::OPM::Maker;
use OTOBO::OPM::Maker::Command::build;

my $build = OTOBO::OPM::Maker::Command::build->new({
    app => OTOBO::OPM::Maker->new,
});

{
    my $return = $build->abstract;
    is $return, 'build package files for OTOBO';
}

{
    my $return = $build->usage_desc;
    is $return, 'opmbuild build [--version <version>] [--output <output_path>] <path_to_sopm>';
}

{
    my @return = $build->opt_spec;
    my $check  = [
        [ "output=s",  "Output path for OPM file" ],
        [ "version=s", "Version to be used (override the one from the sopm file)" ],
    ];
    is_deeply \@return, $check;
}

done_testing;
