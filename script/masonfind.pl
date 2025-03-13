#!/usr/bin/perl

use strict;
use warnings;
use File::Find::Mason;
use Getopt::Long;

sub Help {
	print STDERR "Usage:  $0 [--] file... [--help]\n";
}

my %opt=(
	verbose =>0,
	help    =>0,
);

GetOptions(
	'verbose'=>\$opt{verbose},
	'help'   =>\$opt{help},
);
if($opt{help}||!@ARGV) { exit(Help()) }

foreach my $target (@ARGV) {
	my @found=File::Find::Mason::find({wanted=>undef,%opt{qw/verbose/}},$target);
	if(@found) { print join("\n",@found,"") }
}
