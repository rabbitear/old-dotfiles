#!/bin/bash

CLIPBOARD=$(xclip -o)

# put this in the backup
# soon

# I want to use the =~ but does not seem to be working for me
#if [ "$CLIPBOARD" =~ 'http://' ]

if [ $(expr "$CLIPBOARD" : '\(http://www.youtube.com\)') ]
then
  xterm -g 80x3 -e youtube-dl $CLIPBOARD
  date >> ~/.fvwm/youtube-sites.txt
  echo "---------" >> ~/.fvwm/youtube-sites.txt
  echo "$CLIPBOARD" >> ~/.fvwm/youtube-sites.txt
  echo >> ~/.fvwm/youtube-sites.txt
  scp ${CLIPBOARD/http:\/\/www.youtube.com\/watch?v=/}.flv storage@breadbox:~/shared-read/Youtube/
elif [ $(expr "$CLIPBOARD" : '\(http://\)') ]
then
  surf "$CLIPBOARD" &
  date >> ~/.fvwm/web-sites.txt
  echo "---------" >> ~/.fvwm/web-sites.txt
  echo "$CLIPBOARD" >> ~/.fvwm/web-sites.txt
  echo >> ~/.fvwm/web-sites.txt
else 
  echo "$CLIPBOARD" | festival --tts &
  surf "http://www.google.com/search?q=$CLIPBOARD"
fi

#
# --- orginal so I can go back it. ---
# --- this if expr with a regex to me a long time to make ---
#
#if [ $(expr "$CLIPBOARD" : '\(http://\)') ]
#then
#  surf "$CLIPBOARD"
#else 
#  surf "http://www.google.com/search?q=$CLIPBOARD"
#fi


