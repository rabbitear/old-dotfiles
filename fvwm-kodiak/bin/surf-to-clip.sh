#!/bin/bash

if [ -z "$1" ]
then
  echo "Noooo!"
  exit 1
fi

CLIP=$(xprop -id $1 _SURF_URI) 

# this takes off the _SURF_URI parameter only (first 20 chars)
CLIP=${CLIP:20}

# this removes any " (quotes) in the string
CLIP=${CLIP//\"/}

# pipes whats in CLIP into xclip
echo $CLIP | xclip

