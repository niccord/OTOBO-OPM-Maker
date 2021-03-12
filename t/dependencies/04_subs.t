#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use OTOBO::OPM::Maker;
use OTOBO::OPM::Maker::Command::dependencies;

my $dependencies = OTOBO::OPM::Maker::Command::dependencies->new({
    app => OTOBO::OPM::Maker->new,
});

{
    my $return = $dependencies->abstract;
    is $return, 'list dependencies for OTOBO packages';
}

{
    my $return = $dependencies->usage_desc;
    is $return, 'opmbuild dependencies <path_to_sopm_or_opm>';
}

done_testing;
