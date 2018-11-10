#!/bin/bash
display=()
count=0

customRes()
{
echo "Enter the desired pixels: H-Pixels V-Pixels Hz(e.g. 60.00)"
read $horizontalPixels $verticalPixel $Hz

#Calculate VESA GTF mode lines for desired resolution (horzPix VertPixel Hz)
gtf $horizontalPixels $verticalPixels $Hz

#Add result from previous 
newRes=`gtf $horizontalPixels $verticalPixels $Hz | grep "Modeline" | cut -d " " -f 4`

xrandr --newmode `gtf $horizontalPixels $verticalPixel $Hz|grep "Modeline" |cut -d " " -f 4-19`

xrandr --addmode $targetDisplay $newRes

xrandr --output $targetDisplay --mode $newRes
}

resMenu()
{
#predefined resolutions for 16:9 aspect ratio  (vert x horizontal)
#720(1366x768)(HD),HD+(1600x900),FHD(1920x1080),2K(2560x1440),4K UHD(3840x2160),custom
echo ""
echo "STANDARD PRE-DEFINED RESOLUTIONS"
echo "--------------------------------"
echo "1 - HD		(1366x768 )[720P]"
echo "2 - HD+		(1600x900 )[]"
echo "3 - FHD		(1920x1080)[1080P]"
echo "4 - WQHD	(2560x1440)[2K]"
echo "5 - UHD		(3840x2160)[4K]"
echo "6 - CUSTOM	(specify custom resolution)"
echo "7 - QUIT		(exit this program)"
echo "-----------------------"
echo "SELECT A RESOLUTION:"
read resolutionSelect
if [ $resolutionSelect -eq 1 ];then
echo "you've selected: 1";
gtf 1366 768 59.00
xrandr --newmode `gtf 1366 768 59.00 | grep "Modeline" | cut -d " " -f 4-19`
xrandr --addmode $targetDisplay `gtf 1366 768 59.00 | grep "Modeline" | cut -d " " -f 4`
xrandr --output $targetDisplay --mode `gtf 1366 768 59.00 | grep "Modeline" | cut -d " " -f 4`
elif [ $resolutionSelect -eq 2 ];then
echo "you've selected: 2";
gtf 1600 900 59.00
xrandr --newmode `gtf 1600 900 59.00 | grep "Modeline" | cut -d " " -f 4-19`
xrandr --addmode $targetDisplay `gtf 1600 900 59.00 | grep "Modeline" | cut -d " " -f 4`
xrandr --output $targetDisplay --mode `gtf 1600 900 59.00 | grep "Modeline" | cut -d " " -f 4`
elif [ $resolutionSelect -eq 3 ];then
echo "you've selected: 3";
gtf 1920 1080 59.00
xrandr --newmode `gtf 1920 1080 59.00 | grep "Modeline" | cut -d " " -f 4-19`
xrandr --addmode $targetDisplay `gtf 1920 1080 59.00 | grep "Modeline" | cut -d " " -f 4`
xrandr --output $targetDisplay --mode `gtf 1920 1080 59.00 | grep "Modeline" | cut -d " " -f 4`
elif [ $resolutionSelect -eq 4 ];then
echo "you've selected: 4";
gtf 2560 1440 59.00
xrandr --newmode `gtf 2560 1440 59.00 | grep "Modeline" | cut -d " " -f 4-19`
xrandr --addmode $targetDisplay `gtf 2560 1440 59.00 | grep "Modeline" | cut -d " " -f 4`
xrandr --output $targetDisplay --mode `gtf 2560 1440 59.00 | grep "Modeline" | cut -d " " -f 4`
elif [ $resolutionSelect -eq 5 ];then
echo "you've selected: 5";
gtf 3840 2160 59.00
xrandr --newmode `gtf 3840 2160 59.00 | grep "Modeline" | cut -d " " -f 4-19`
xrandr --addmode $targetDisplay `gtf 3840 2160 59.00 | grep "Modeline" | cut -d " " -f 4`
xrandr --output $targetDisplay --mode `gtf 2160 768 59.00 | grep "Modeline" | cut -d " " -f 4`
elif [ $resolutionSelect -eq 6 ];then
echo "you've selected: 6";
#call custom function here
elif [ $resolutionSelect -eq 7 ];then
echo "Quiting..."
else 
echo "Error: Invalid input"
fi

#Calculate VESA GTF mode lines for desired resolution (h-pixe;s v-pixels Hz)
#echo "SYNOPSIS"
#echo "h-pixels v-pixels hz"
}

checkDisplayValid()
{
if [ -z $targetDisplay ];then
	echo "targetDisplay = N/A - Invalid"
else
	targetDisplay=${display[$disNum]}
	echo "Target Display :  .  .  .  .  .  .  .  .   $targetDisplay"
resMenu
fi
}

clear
echo "Display(s)"
echo "---------"

for x in $(xrandr |cut -d " " -f 1-2|grep -w "connected"| cut -d " " -f1);
do
let count+=1;
display[$count]=$x
echo "$count: "${display[$count]}
done

echo ""
echo ""
echo "Enter display number :"
read disNum

if [ $disNum = 1 ]; then
	targetDisplay=${display[$disNum]}
	checkDisplayValid $1
elif [ $disNum = 2 ]; then
	targetDisplay=${display[$disNum]}
	checkDisplayValid $1
elif [ $disNum = 3 ]; then
	checkDisplayValid $1
	targetDisplay=${display[$disNum]}
elif [ $disNum = 4 ]; then
	targetDisplay=${display[$disNum]}
	checkDisplayValid $1
elif [ $disNum = 5 ]; then
	targetDisplay=${display[$disNum]}
	checkDisplayValid $1
elif [ $disNum = 6 ]; then
	targetDisplay=${display[$disNum]}
	checkDisplayValid $1
else
echo "Error invalid option or too many monitors(>6)!"

fi


