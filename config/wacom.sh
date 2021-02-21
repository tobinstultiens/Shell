#!/bin/sh

# Set Screen
xsetwacom set "Wacom Intuos Pro L Pen stylus" MapToOutput HDMI2
xsetwacom set 'Wacom Intuos Pro L Pen eraser' MapToOutput HDMI2
# Set to left handed
xsetwacom set 'Wacom Intuos Pro L Pen stylus' rotate half
xsetwacom set 'Wacom Intuos Pro L Pen eraser' rotate half
xsetwacom set 'Wacom Intuos Pro L Finger touch' rotate half

# check if osu was added as parameter
if [ $1 = "osu" ]; then
    # Set small drawing area
    xsetwacom set 'Wacom Intuos Pro L Pen stylus' Area 0 0 15000 10000
    xsetwacom set 'Wacom Intuos Pro L Pen eraser' Area 0 0 15000 10000
fi
