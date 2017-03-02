#!/usr/bin/perl -w

open INPUT_FH, '<','/Volumes/myMAC/asxl1sfRNAseq/gsea/asxl1sfexp.txt' or die;
my %hash;
while(my $hash = <INPUT_FH>){
    chomp($hash);
    my @hash = split /\t/,$hash;
    my $key = $hash[0];
    my $value = $hash;
    $hash{$key} = $value;
}
close INPUT_FH;

open LIST_FH,'<','/Volumes/myMAC/asxl1sfRNAseq/gsea/list.txt' or die;
open OUT_FH,'>','/Volumes/myMAC/asxl1sfRNAseq/gsea/out.txt' or die "$!";
while(<LIST_FH>){
    chomp;
    if($hash{$_}){print OUT_FH "$_\t$hash{$_}\n";}
    else{print OUT_FH "$_\tNA\n";}
}
