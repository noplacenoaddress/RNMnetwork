#!perl

# slurp the entire file
local $/ = undef;
open INFILE, $ARGV[0] or die "Could not open file. $!";
$string = <INFILE>;
close INFILE;

while ($string =~ s/\*\*(.*)\*\* \[\[\d+\]\]\((.*)\)/<a href="$2">$1<\/a>/) {}

print "$string";
