package OTOBO::OPM::Maker;

use strict;
use warnings;

use App::Cmd::Setup -app;

# ABSTRACT: Module/App to build and test OTOBO packages

our $VERSION = '0.18';

=head1 DESCRIPTION

If you do OTOBO package development, you need to be able to check your package: Are all files of the package included in the file list in the sopm file? Is the sopm file valid? And you need to create the OPM file. There is otobo.PackageManager.pl included in OTOBO installations, but sometimes you might not have an OTOBO installation on the machine where you want to build the package (e.g. when you build the package in a L<Jenkins|http://jenkins-ci.org> job).

C<OTOBO::OPM::Maker> provides C<opmbuild> that is a small tool for several tasks. At the moment it supports:

=over 4

=item * filetest

Check if all files in the filelist exist on your disk and if all files on the disk are listed in the filelist

=item * somptest

Checks if your .sopm file is valid

=item * dependencies

List all CPAN- and OTOBO- dependencies of your package

=item * build

Create the OPM file

=item * index

build an index file for an OPM repository.

=back

Currently under development:

=over 4

=item * dbtest

Check if the C<DatabaseInstall> and C<DatabaseUninstall> sections in your .sopm files are valid. And it checks for SQL keywords.

=back

=cut

1;
