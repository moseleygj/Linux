#!/bin/bash

display=()
count=0


hello_world()
{
if [ -z $targetDisplay ];then
	echo targetDisplay="N/A --$1"
else
	targetDisplay=${display[$disNum]}
	echo targetDisplay[NOT EMPTY]=$targetDisplay
fi
}


clear
echo "Display"
echo "--------"
for x in $(xrandr |cut -d " " -f 1-2|grep -w "connected"| cut -d " " -f1);
do
let count+=1;
display[$count]=$x
echo "$count: "${display[$count]}
done
echo ""
echo "Enter display number:"
read disNum


if [ $disNum = 1 ]; then
	echo "option 1: selected"
	targetDisplay=${display[$disNum]}
	echo "display is ${display[$disNum]}"
	hello_world $targetDisplay

elif [ $disNum = 2 ]; then
	echo "option 2: selected"
	hello_world $1

elif [ $disNum = 3 ]; then
	echo "option 3: selected"
	targetDisplay=${display[$disNum]}

elif [ $disNum = 4 ]; then
	echo "option 4: selected"
	targetDisplay=${display[$disNum]}

elif [ $disNum = 5 ]; then
	echo "option 5: selected"
	targetDisplay=${display[$disNum]}

elif [ $disNum = 6 ]; then
	targetDisplay=${display[$disNum]}
	echo "option: 6 selected"
	targetDisplay=${display[$disNum]}
else
echo "Error invalid option or too many monitors(>6)!"

fi


#add an option for 30hz-60hz

