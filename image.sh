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

echo "Here are a list of avalible  ISO images in your current directory:"
echi "__________________________________________________________________"
du -b $filename *.iso
echo " ";

#show availible disk on the system:
echo "Avilible disk on the system: "
echo "_____________________________"
sudo fdisk -l| grep 'Disk /dev/s'

#syntax for pv is as followed:
# input | pv | output
# dd if=/dev/urandom | pv | dd of=/dev/null
