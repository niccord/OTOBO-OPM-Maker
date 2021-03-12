#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use OTOBO::OPM::Maker;
use OTOBO::OPM::Maker::Command::dbtest;

my $dbtest = OTOBO::OPM::Maker::Command::dbtest->new({
    app => OTOBO::OPM::Maker->new,
});

{
    my $return = $dbtest->abstract;
    is $return, 'Check if DatabaseInstall and DatabaseUninstall sections in the .sopm are correct';
}

{
    my $return = $dbtest->usage_desc;
    is $return, 'opmbuild dbtest <path_to_sopm>';
}

done_testing;
