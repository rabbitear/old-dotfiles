#!/usr/bin/perl
#== #DJAMORPHEUS#============================
#== This Script Parses rss files ============
#== and adds entries to your menu ===========
#== Usage: rss.pl  
#===========================================
#use warnings;
#use strict;
use LWP::Simple;
use XML::RSS;

my $rss = new XML::RSS();
my $content = get("$ARGV[0]");
die "Couldn't get Content.\n" unless defined $content;
my $www = $ARGV[1];
die "Set Browser!\n" unless defined $www;
#Parse RSS
$rss->parse($content);

#RSS Variables
my $title = $rss->channel('title');
my @title = split( /:/, $title);
print qq|+ "$title[0]" Title\n|;
foreach my $item (@{$rss->{'items'}}) {
        my $i_title = $item->{'title'};
        my $url = $item->{'link'};
        print qq|+ "$i_title" Exec exec $www $url\n|;
}

