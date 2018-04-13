#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

my $help = 0;
my $intervals = '30;30;30;30;30;40;45;50;60;65;70;85;100'; #fan speed intervals, with default values set
my @intervalsArray;
my $method = 0; #installation method
my $verbose = 0;
my $startup = ''; #startup option

my $userPath = `echo $HOME`;
my $installPath = "/$userPath/.NvidiaFanCurve/NvidiaFanCurve.bash"; #defaulted unless specified by user

#Getopt to handle command line arguements
#refer to perl docs for usage guidelines
GetOptions('help' = \$help, 'intervals|i=s' = \$intervals, 'method|m=s' = \$method, 'startup|s=s' = \$startup,'verbose' = \$verbose)
or die("Error with command line arguements\n");

if($help){
    #TODO print help guideline
    exit;
}

#Determine if intervals were parsed correctly
if(($intervals =~ /(\d{1,3}(;|,)*){13}/)){
    @intervalsArray = split(/;|,/, $intervals);
}else{
    print 'Incorrect intervals string: parse 13 intervals in CSV format --intervals=30;40;50... or --intervals=30,40,50...';
    exit;
}

if($method ne 'desktop' || $method ne 'systemd'){
    print 'Incorrect method string: unknown method parsed';
    exit;
}elsif($method eq 'systemd'){
    #Does not require startup parameter to be parsed
    #TODO fill in required systemd installation steps
}elsif($method eq 'desktop'){
    #TODO fill in required .desktop installation steps
    #DE startup methods
    if($startup eq 'i3'){
        `echo exec_always --no-startup-id bash $installPath >> /$userPath/.config/i3/config`;
    }elsif($startup eq 'gnome'){

    }
}


