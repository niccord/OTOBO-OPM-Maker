package OTOBO::OPM::Maker::Command::dependencies;

# ABSTRACT: List dependencies of OTOBO packages

use strict;
use warnings;

use XML::LibXML;

use OTOBO::OPM::Maker -command;

our $VERSION = '0.18';

sub abstract {
    return "list dependencies for OTOBO packages";
}

sub usage_desc {
    return "opmbuild dependencies <path_to_sopm_or_opm>";
}

sub validate_args {
    my ($self, $opt, $args) = @_;
    
    $self->usage_error( 'need path to .sopm or .opm' ) if
        !$args or
        'ARRAY' ne ref $args or
        !defined $args->[0] or
        $args->[0] !~ /\.s?opm\z/ or
        !-f $args->[0];
}

sub execute {
    my ($self, $opt, $args) = @_;
    
    my $file = $args->[0];
    my $parser = XML::LibXML->new;
    my $tree   = $parser->parse_file( $file );
        
    my $root_elem = $tree->getDocumentElement;
    
    # retrieve file information
    my @package_req = $root_elem->findnodes( 'PackageRequired' );
    my @modules_req = $root_elem->findnodes( 'ModuleRequired' );
    
    my %labels = (
        PackageRequired => 'OTOBO add on',
        ModuleRequired  => 'CPAN module',
    );
        
    DEP:
    for my $dependency ( @package_req, @modules_req ) {
        my $type    = $dependency->nodeName;
        my $version = $dependency->findvalue( '@Version' );
        my $name    = $dependency->textContent;
        
        print "$name - $version (" . $labels{$type} . ")\n";
    }
}

1;
