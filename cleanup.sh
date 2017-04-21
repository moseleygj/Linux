#Gordon Moseley 2017
#Simple script to clean a clutter Download folder
clear
echo "============================================"
echo "          Download-Folder Cleaner           "
echo "============================================"
pictures="/home/`whoami`/Pictures"
documents="/home/`whoami`/Documents"
video="/home/`whoami`/Videos"
music="/home/`whoami`/Music"
gif="/home/`whoami`/Pictures/GIFs"
##keep ISOs and Images in the Download folder

##Remove the single has "#" from the beginging of lines to make script active
##pictures
if [ -d "$pictures" ]; then
echo "Directory: $pictures exist";
#mv *.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP,ico,ICO}
else
echo "Directory: $pictures directory doesn't exist."
echo
echo "Creating directory \"Pictures\"...";
mkdir $pictures
#mv *.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP,ico,ICO}
fi
mv *.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP,ico,ICO}

##documents
if [ -d "$douments" ]; then
echo "Directory: $documents exist";
#mv *.{txt,TXT,doc,DOC,docx,DOCX,rtf,RTF,pdf,PDF}
else
echo "Directory: $documents directory doesn't exist."
echo
echo "Creating directory \"Documents\"...";
mkdir $documents
#mv *.{txt,TXT,doc,DOC,docx,DOCX,rtf,RTF,pdf,PDF}
fi


##video
if [ -d "$video" ]; then
echo "Directory: $video exist";
#mv *.{mp4,MP4,mpeg,MPEG,mov,MOV,flv,FLV,mpg,MPG}
else
echo "Directory: $video directory doesn't exist."
echo
echo "Creating directory \"Videos\"...";
mkdir $video
#mv *.{mp4,MP4,mpeg,MPEG,mov,MOV,flv,FLV,mpg,MPG}
fi


##music
if [ -d "$music" ]; then
echo "Directory: $music exist";
#mv *.{MP3,mp3}
else
echo "Directory: $music directory doesn't exist."
echo
echo "Creating directory \"Music\"...";
mkdir $music
#mv *.{MP3,mp3}
fi

##gif
if [ -d "$gif" ]; then
echo "Directory: $gif exist";
#mv *.{GIF,gif}
else
echo "Directory: $gif directory doesn't exist."
echo
echo "Creating directory \"GIFs\"...";
mkdir $gif
#mv *.{GIF,gif}
fi