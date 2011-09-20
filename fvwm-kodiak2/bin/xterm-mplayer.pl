#!/usr/bin/perl -w

print "Trying to play $ARGV[0]\n"; 
system "killall", "mplayer";

if ( $ARGV[0] =~ /(.pls$|.m3u$)/ ) {
	print "this is a playlist!\n";
	system "xterm -tn Player +sb -fn 5x7 -geometry 40x4 -fg darkgreen -bg lightgreen -T Player -e \"mplayer -playlist $ARGV[0]\"";
} else {
	print "this is NOT a playlist\n";
	system "xterm -tn Player +sb -fn 5x7 -geometry 40x4 -fg darkgreen -bg lightgreen -T Player -e \"mplayer $ARGV[0]\"";
}

