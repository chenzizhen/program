#!/usr/bin/perl -w
use autodie;
use strict;
open REFFLAT_FH,'<','/Volumes/myMAC/asxl1chipseq/bed/refFlat.txt' or die "$!";
open REF_FH,'>>','/Volumes/myMAC/asxl1chipseq/bed/tss-tts.cod' or die "$!";
print REF_FH "#id\tchrom\tstart\tend\tstrand\n";
while (my $lines = <REFFLAT_FH>){
    chomp($lines);
    my @lines = split"\t",$lines;
    if($lines[3] eq '+'){printf REF_FH "%s\t%s\t%d\t%d\t%s\n",$lines[0],$lines[2],$lines[4],$lines[5],$lines[3];}
    if($lines[3] eq '-'){printf REF_FH "%s\t%s\t%d\t%d\t%s\n",$lines[0],$lines[2],$lines[4],$lines[5],$lines[3];}
}
close REFFLAT_FH;
close REF_FH;
