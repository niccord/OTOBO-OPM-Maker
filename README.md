[![Build Status](https://travis-ci.org/reneeb/OTOBO-OPM-Maker.svg?branch=master)](https://travis-ci.org/reneeb/OTOBO-OPM-Maker)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/OTOBO-OPM-Maker.png)](http://cpants.charsbar.org/dist/overview/OTOBO-OPM-Maker)
[![GitHub issues](https://img.shields.io/github/issues/reneeb/OTOBO-OPM-Maker.svg)](https://github.com/reneeb/OTOBO-OPM-Maker/issues)

# NAME

OTOBO::OPM::Maker - Module/App to build and test OTOBO packages

# VERSION

version 0.18

# DESCRIPTION

If you do OTOBO package development, you need to be able to check your package: Are all files of the package included in the file list in the sopm file? Is the sopm file valid? And you need to create the OPM file. There is otobo.PackageManager.pl included in OTOBO installations, but sometimes you might not have an OTOBO installation on the machine where you want to build the package (e.g. when you build the package in a [Jenkins](http://jenkins-ci.org) job).

`OTOBO::OPM::Maker` provides `opmbuild` that is a small tool for several tasks. At the moment it supports:

- filetest

    Check if all files in the filelist exist on your disk and if all files on the disk are listed in the filelist

- somptest

    Checks if your .sopm file is valid

- dependencies

    List all CPAN- and OTOBO- dependencies of your package

- build

    Create the OPM file

- index

    build an index file for an OPM repository.

Currently under development:

- dbtest

    Check if the `DatabaseInstall` and `DatabaseUninstall` sections in your .sopm files are valid. And it checks for SQL keywords.



# Development

The distribution is contained in a Git repository, so simply clone the
repository

```
$ git clone http://github.com/niccord/OTOBO-OPM-Maker.git
```

and change into the newly-created directory.

```
$ cd OTOBO-OPM-Maker
```

The project uses [`Dist::Zilla`](https://metacpan.org/pod/Dist::Zilla) to
build the distribution, hence this will need to be installed before
continuing:

```
$ cpanm Dist::Zilla
```

To install the required prequisite packages, run the following set of
commands:

```
$ dzil authordeps --missing | cpanm
$ dzil listdeps --author --missing | cpanm
```

The distribution can be tested like so:

```
$ dzil test
```

To run the full set of tests (including author and release-process tests),
add the `--author` and `--release` options:

```
$ dzil test --author --release
```

# AUTHOR

Renee Baecker <reneeb@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 by Renee Baecker.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)
