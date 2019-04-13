#!/usr/bin/env bash -x

#lynx -dump 'https://www.youtube.com/results?search_query=afroman+because+i+got+high+mp3'|grep watch|grep https|awk '{print $2}'|head -n 1

#search for playlist(grep "PL" in link)
#lynx -dump 'https://www.youtube.com/results?search_query='|grep https|grep PL|awk '{print $2}'

link="| grep PL | grep https | awk '{print \$2}'"
div="------------------------------------------------------"

p1="lynx -dump "
p2=\'
p3="https://www.youtube.com/results?search_query="

yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file song.txt"
n=""
ext=".txt"

clear

echo "Enter the genre, year and/artist playlist:"
read song;
echo "Playlist name:"
#check to see if playlist already exist
read playListName

if [ -f playListName ];
then
echo "This file already exist."
else
touch $playlist$ext
echo "File \"$playListName\" created sucessfully..."
fi

for i in $song
do
queryString+="$i+";
done

clear
new=$(echo -n $queryString)
#new=$(echo -n $queryString | head -c -1)

newer="$new+playlist"
echo "SEARCHING FOR PLAYLIST INCLUDING: $song . . ."
echo ""
comp=$p1$p2$p3$newer$p2$link
eval $comp > $playListName
echo "♪ Downloading..."
#eval $yd
echo ""

echo "=========================================="
echo "😃 PLAYLIST DOWNLOAD COMPLETE!            "
echo " Your \"$playListName\" file is populated."
echo "=========================================="

#echo $(date +%b_%d_%Y);