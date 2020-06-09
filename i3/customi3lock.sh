#!/bin/sh

overlay=/usr/share/pixmaps/lockoverlay.png

scrot -o /tmp/currentworkspace.png
convert /tmp/currentworkspace.png -blur 0x5 /tmp/currentworkspaceblur.png
composite -gravity southeast $overlay /tmp/currentworkspaceblur.png /tmp/lockbackground.png
xset s on
i3lock -i /tmp/lockbackground.png -n; xset s off -dpms
