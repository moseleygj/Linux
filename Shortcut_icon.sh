#!/bin/bash
#This script is to allow you to make add gnome icons to fedora 
#/home/ieatpcs/Downloads/sublime_text_3/sublime_text
echo "Enter the Type"
read type
echo "Type=$type">>$file

echo "Enter the Application Name:";
read name;
echo "Name=$name">>$file

echo "Enter Comment"
read comment
echo "Comment=\"$comment\"">>$file

echo "Enter Icon Path:[exp:/home/name/icon.ico]:"
read icon
echo "Icon=$Icon">>$file

echo "Enter the Execution command:"
read executeC
echo "Exec=$executeC">>$file

echo "Terminal [true/false]:"
read TF
echo "Terminal=$TF">>$file

echo "Enter the Categories[exp: Development;IDE;Java;]:"
read category
echo "Categories=$category">>$file