#!/usr/bin/env perl

use strict;
use warnings;

die "Usage: perl link.pl <tag_to_lookup>\n"
    unless @ARGV;

my $Tag = shift;

use lib '../lib';
use CPAN::LinksToDocs;

my $linker = CPAN::LinksToDocs->new;

for ( @{ $linker->link_for($Tag) } ) {
    print "$_\n";
}