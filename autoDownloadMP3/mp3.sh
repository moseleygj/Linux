#!/usr/bin/bash
#lynx -dump 'https://www.youtube.com/results?search_query=afroman+because+i+got+high+mp3'|grep watch|grep https|awk '{print $2}'|head -n 1
dump="lynx -dump 'https://www.youtube.com/results?search_query="
link="| grep watch | grep https | awk '{print \$2}'| head -n 1"
div="------------------------------------------------------"

p1="lynx -dump "
p2=\'
p3="https://www.youtube.com/results?search_query="

yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file song.txt"
n=""

clear
echo "Enter song name and artist:";
read song;
for i in $song
do
queryString+="$i+";
done

clear
new=$(echo -n $queryString | head -c -1)
newer="$new+audio"
echo "🔍 SEARCHING FOR: $song"
echo ""
comp=$p1$p2$p3$newer$p2$link
eval $comp > song.txt
echo "♪ Downloading..."
eval $yd
echo ""

echo "======================"
echo "😃 DOWNLOAD COMPLETE! "
echo "======================"

#echo $(date +%b_%d_%Y);
