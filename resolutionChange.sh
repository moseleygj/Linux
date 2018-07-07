#!/bin/bash
#remember to comment remove the comment from the /etc/gdm/custom.conf file labeled "WaylandEnable=false"


#find out what display to apply it to
xrandr

echo "Enter the display you want to use:"
read $monitor

echo "Enter the desired pixels: Horiz(in Pixels) Vert(in Pixels) Hz"
read $horizontalPixels $VerticalPixel $Hz
#calculate VESA GTF mode lines for desired resolution (horzPix VertPixel Hz)
gtf 2048 1152 60

#add result from previous 

xrandr --newmode "2048x1152_60.00"  197.97  2048 2184 2408 2768  1152 1153 1156 1192  -HSync +Vsync
xrandr --addmode LVDS-1 "2048x1152_60.00"
xrandr --output LVDS-1 --mode "2048x1152_60.00"



