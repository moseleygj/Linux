counter=1

while [ $counter -gt 0 ]
do
    echo "Please enter URL:"
    read URL
    /home/moseleyg/Downloads/yt-dlp/./yt-dlp.sh -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $URL
#    play notifications.mp3 &> /dev/null
    clear
    echo "Download Complete!"
done
