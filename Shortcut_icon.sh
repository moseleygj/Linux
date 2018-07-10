#!/bin/bash
#This script is to allow you to make add gnome icons to fedora 
#/home/ieatpcs/Downloads/sublime_text_3/sublime_text

echo "Enter name of the shortcut to be added on Menu"
read shortcut
if [ -e $shortcut  ]; then
echo "this shortcut already exist! Exiting..."
exit 0;

elif [ $shortcut = "" ]; then
echo "you cant use a shortcut with an empty name to call it from! Exiting...";
else
touch $shortcut.desktop">>$file;
echo "$shortcut.desktop created successfully...";
fi

echo "Enter the Type:[default: Application]";
read filetype
if [ $filetype = "" ]; then
$filetype = "Application"
echo "Type=$filetype">>$file
fi

echo "Enter the Application Name:";
read name;
echo "Name=$name">>$file

echo "Enter a Comment:"
read comment
echo "Comment=\"$comment\"">>$file

echo "Enter Icon Path:[exp:/home/name/icon.ico]:"
read icon
echo "Icon=$icon">>$file

echo "Enter the Execution command with full path:"
read executeC
#check if file exist fist, then continue
if [ -e $executeC ]; then
echo "Exec=$executeC">>$file
else
echo "That file doesn\'t exist."
echo "exiting"
fi

echo "Terminal [true/false]:"
read TF
if [ $TF = "" ]; then
TF = "false";
echo "Terminal=$TF">>$file
fi

echo "Enter the Categories[exp: Development;IDE;Java;]:"
read category
echo "Categories=$category">>$file

chmod +x $shortcut.desktop
echo " $shortcut.desktop is now excutable and ready to be added to the Main menu."
