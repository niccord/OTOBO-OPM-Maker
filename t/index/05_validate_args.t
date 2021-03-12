#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use File::Basename;
use File::Spec;

use OTOBO::OPM::Maker;
use OTOBO::OPM::Maker::Command::index;

my $index = OTOBO::OPM::Maker::Command::index->new({
    app => OTOBO::OPM::Maker->new
});

{
    my $error;
    eval { $index->validate_args(); 1;} or $error = $@;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, undef ); 1;} or $error = $@;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, {} ); 1;} or $error = $@;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, [] ); 1;} or $error = $@;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, [undef] ); 1;} or $error = $@;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, [__FILE__] ); 1;} or $error = $@;;
    like $error, qr/Error: need path to directory that contains opm files/;
}

{
    my $error;
    eval { $index->validate_args( undef, ['.'] ); 1;} or $error = $@;;
    is $error, undef;
}

done_testing;
