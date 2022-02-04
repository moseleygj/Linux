counter=1

while [ $counter -gt 0 ]
do
    echo "Please enter Playlist URL:"
    read URL

/home/moseleyg/Downloads/yt-dlp/./yt-dlp.sh -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"  $URL
#    play notifications.mp3 &> /dev/null
    clear
    echo "Download Complete!"
done
