#!/usr/bin/bash

yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file honeyPot.txt"
n=""
div="============================================================"
links="honeyPot.txt"
touch $links
clear
count=0;
bold="\e[1m"
end="\e[0m"

if [ -s $links ]
then
    echo " ✔ File is loaded. "
else
    echo "😞 Oops..." #error
    echo $div
    echo "It looks like your \"$links\" playlist file is EMPTY!. "
    echo "Let's fill it up! "
    echo $n
    echo "INSTRUCTIONS"
    echo "------------"
    echo $n
    echo "✔📝 Open \"$links\"."
    echo "✔🌎 Go to Youtube from your browser and search for your desired playlist."
    echo "✔➕ Copy the browser link(s) for the desired YouTube playlist & add them to the \"$links\" file."
    echo "✔💾 Save \"$links\"."
    echo "✔🏃 Re-run this script. (TYPE: sh MP3playlist.sh and press [ENTER])"
    echo $div
    echo $n
fi

for i in $(cat $links)
do
    echo $i
    ((count++));
done


if [ $count -lt 1 ]
then
    exit
else
    echo "$count playlist links found. 😃"
    echo ""
    echo "♪ Downloading Playlist. Please wait..."
    eval $yd
echo ""
fi

echo "======================"
echo " 😃DOWNLOAD COMPLETE! "
echo "======================"

#echo $(date +%b_%d_%Y);
