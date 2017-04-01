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
type pv >/dev/null 2>&1 || {
 echo >&2 "I require foo but it's not installed.  Aborting."; }

#Get size of files

echo "Here are a list of avalible  images in your current directory:"
du -b $filename *.sh



#syntax for pv is as followed: 
# input | pv | output
# dd if=/dev/urandom | pv | dd of=/dev/null

