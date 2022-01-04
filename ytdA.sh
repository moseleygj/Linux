counter=1

while [ $counter -gt 0 ]
do
    echo "Please enter URL:"
    read URL
#    yt-dlp.sh -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $URL

/home/moseleyg/Downloads/yt-dlp/./yt-dlp.sh --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist $URL
#    play notifications.mp3 &> /dev/null
    clear
    echo "Download Complete!"
done
