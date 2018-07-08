#!/bin/bash
#remember to comment remove the comment from the /etc/gdm/custom.conf file labeled "WaylandEnable=false"


#find out what display to apply it to
xrandr
#xrandr |cut -d " " -f 1-2|grep -w "connected"

echo "Enter the display you want to use:"
read $monitor

echo "Enter the desired pixels: Horiz(in Pixels) Vert(in Pixels) Hz(e.g. 60.00)"
read $horizontalPixels $verticalPixel $Hz

#Calculate VESA GTF mode lines for desired resolution (horzPix VertPixel Hz)
gtf 2048 1152 60
#gtf $horizontalPixels $verticalPixels $Hz

#Add result from previous 
newRes=`gtf $horizontalPixels $verticalPixels $Hz | grep "Modeline" | cut -d " " -f 4`

xrandr --newmode "2048x1152_60.00"  197.97  2048 2184 2408 2768  1152 1153 1156 1192  -HSync +Vsync
#xrandr --newmode `gtf $horizontalPixels $verticalPixel $Hz|grep "Modeline" |cut -d " " -f 4-19`

xrandr --addmode LVDS-1 "2048x1152_60.00"
#xrandr --addmode $monitor $newRes

xrandr --output LVDS-1 --mode "2048x1152_60.00"
#xrandr --output $monitor --mode $newRes
