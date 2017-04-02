#!/usr/bin/bash
#Name:    Linux Automation project
#purpose: Generate image file with progress 
#author:  Gordon Moseley
#-------------------------------------------------------------------
clear
#check if use is root. dd can't run unless user had root privilege.
if [[ $UID != 0 ]]; then
    echo "You don't have sufficient privileges to run this script."
    exit 1
fi

#check if user has the desired program "pv" to complete the program.
#note: you can use "status=progress" to  the end of your dd command
type pv >/dev/null 2>&1 || {
 echo >&2 "I require \"pv\" but it's not installed. Please install pv to continue. ";exit 1; }

#Get size of files

echo "Here are a list of avalible images in your current directory:"
echo "Enter the name of the image you want to use:";
du -b $filename *.iso
read isoimg
echo " ";

#show availible disk on the system:
#lsblk will also work
echo "Avilible disk on the system: "

IFS=$'\n'       # make newlines the only separator
for j in $(sudo fdisk -l| grep 'Disk /dev/s' | sed s/Disk// | cut -d ' ' -f1-4|sed s/,//)    
do
    c=$(($c+1));
    echo "Drive $c: $j";
done 
#syntax for pv is as followed: 
# input | pv | output
# dd if=/dev/urandom | pv | dd of=/dev/null
