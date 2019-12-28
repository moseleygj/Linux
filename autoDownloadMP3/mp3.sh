#!/usr/bin/env bash
#lynx -dump 'https://www.youtube.com/results?search_query=afroman+because+i+got+high+mp3'|grep watch|grep https|awk '{print $2}'|head -n 1
getMusic()
{

dump="lynx -dump 'https://www.youtube.com/results?search_query="        #Base search link for youtube.com
link="| grep watch | grep https | awk '{print \$2}'| head -n 1"         #Removes top link from list of results
link1="| grep watch | grep https| awk '{print \$2}'|head -n 1" 
div="------------------------------------------------------"            

p1="lynx -dump "                                                        #Part_1 of link to be concatenated
p2=\'                                                                   #Part_2 (singe-qoute)to be concatenated '            
p3="https://www.youtube.com/results?search_query="                      #Part_3 base link (youtube search) to be concatenated

#Extract mp3 from videos in "song.txt" in batch
yd="youtube-dl -x -i --extract-audio --audio-format mp3 --quiet --yes-playlist --batch-file song.txt"
n=""

#==>start point for loop<==


clear
echo "Enter Artist and Title:";
read song;
for i in $song
do
queryString+="$i+";                                                     #queryString holds name of song.
done

clear
#this version works on macOS
#new=$(echo -n $queryString | sed -e "s/.$//")

#This version works on Linux
new=$(echo -n $queryString | head -c -1)                                #song name with + for spaces

newer="$new+audio"                                                      #song name with + for spaces+audio

echo "🔍 Searching. Please Wait... "
echo ""
comp=$p1$p2$p3$newer$p2$link1

#lynx -dump 'https://www.youtube.com/results?search_query=Some+Name+Aduo'| grep watch | grep https | awk '{print \$2}'| head -n 1
eval $comp > song.txt
echo "💾  Found! Downloading ..."
eval $yd
echo ""

echo "======================"
echo "✔️  DOWNLOAD COMPLETE!" 
echo "======================"
sleep 2;
getMusic
}
getMusic


