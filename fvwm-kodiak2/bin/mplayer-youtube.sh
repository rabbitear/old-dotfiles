#!/bin/sh
#
# Public domain
# Author: roman [] tsisyk.com
#
# Usage: ./me url [youtube-dl parameters]
#

COOKIE_FILE=/var/tmp/youtube-dl-cookies.txt
mplayer -cache 1024 -framedrop -cookies -cookies-file ${COOKIE_FILE} $(./youtube-dl -f 5 -g --cookies ${COOKIE_FILE} $*)
#  - Try -cache 8192.

