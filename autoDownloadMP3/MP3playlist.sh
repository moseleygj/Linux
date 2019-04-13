#!/usr/bin/env bash
#search for playlist only
#lynx -dump 'https://www.youtube.com/results?search_query=top+rap+playlist'|grep https|grep PL|awk '{print $2}'
#lynx -dump 'https://www.youtube.com/results?search_query=top+rap+playlist'|grep https|grep PL|awk '{print $2}'

rnb="rnb.txt"
links=$rnb
yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file $rnb"
n=""
div="============================================================"

echo $rnb

#rnb.txt
#rapANDrnb.txt
#rap.txt
touch $links
clear
count=0;
bold="\e[1m"
end="\e[0m"

if [ -s $links ]
then
    echo "✔ Loaded: \"$links\". "
    echo " "
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
 ((count++));
    echo ♪ Playlist $count: $i
done


if [ $count -lt 1 ]
then
    exit
else
    echo ""
    echo "$count playlist found."
    echo ""
    echo "💾 Downloading playlist. Please wait..."
    eval $yd
echo ""
fi

echo "======================"
echo " 😃DOWNLOAD COMPLETE! "
echo "======================"

#echo $(date +%b_%d_%Y);
