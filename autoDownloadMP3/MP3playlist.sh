#!/usr/bin/env bash
#search for playlist only
#lynx -dump 'https://www.youtube.com/results?search_query=top+rap+playlist'|grep https|grep PL|awk '{print $2}'
#lynx -dump 'https://www.youtube.com/results?search_query=top+rap+playlist'|grep https|grep PL|awk '{print $2}'

playList="rnb.txt"                  #  <=place playlist here
links=$playList
yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file $playList"
n=""
div="============================================================"

echo $playList

#billboardTop100.txt  soca.txt       top100_09.txt  top100_90.txt
#classical.txt        song.txt       top100_10.txt  top100_91.txt
#hiphop.txt           top100_00.txt  top100_11.txt  top100_92.txt
#honeyPot.txt         top100_01.txt  top100_12.txt  top100_93.txt
#jazz.txt             top100_02.txt  top100_13.txt  top100_94.txt
#metal.txt            top100_03.txt  top100_14.txt  top100_95.txt
#rapANDrnb.txt        top100_04.txt  top100_15.txt  top100_96.txt
#rap.txt              top100_05.txt  top100_16.txt  top100_97.txt
#reggae.txt           top100_06.txt  top100_17.txt  top100_98.txt
#rnb.txt              top100_07.txt  top100_18.txt  top100_99.txt
#rock.txt             top100_08.txt  top100_19.txt

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
