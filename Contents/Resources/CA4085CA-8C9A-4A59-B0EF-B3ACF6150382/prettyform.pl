#!/usr/bin/perl -w

use strict;
use warnings;
use FindBin;
use lib "$FindBin::RealBin/lib";
use JSON qw(from_json to_json);

my $buffer = join('', <STDIN>);
my @pairs = split(/&/, $buffer);
my %in;
foreach my $pair (@pairs) {
 my ($name, $value) = split(/=/, $pair);
 $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
 $in{$name} = $value; 
}

print to_json(\%in, {pretty=>1})


