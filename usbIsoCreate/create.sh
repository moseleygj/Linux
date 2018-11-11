#!/usr/bin/bash
IFS=''
clear
echo "Please remove your USB devices and press ENTER to continue..."

read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

if [[ $key = "" ]]; then 
    echo 'You pressed enter!'
    #continue writing code
    #check if root
    sudo lsblk >> old_state.txt
    echo 'please plug in your USB device'
    sleep 8
    sudo lsblk >> new_state.txt
    echo "New device is at: "$(diff old_state.txt new_state.txt)

else
    echo "You pressed '$key'"
fi

