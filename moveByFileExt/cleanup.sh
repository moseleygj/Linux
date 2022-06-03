#Gordon Moseley 2017
#Simple script to clean a cluttered Download folder
#dont for get to uncomment the lines that begin with #mv to make things active
clear
echo "============================================"
echo "          Download-Folder Cleaner           "
echo "============================================"
#MacOS directories user '/Users/`whoami`/'
pictures="/home/`whoami`/Pictures"
documents="/home/`whoami`/Documents"
video="/home/`whoami`/Videos"
music="/home/`whoami`/Music"
gif="/home/`whoami`/Pictures/GIFs"
##keep ISOs and Images in the Download folder

##Remove the single has "#" from the beginging of lines to make script active
##pictures
if [ -d "$pictures" ]; then
  echo "Directory: $pictures exist.";
#mv *.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP,ico,ICO,gif,GIF,}tiff,TIFF $pictures
else
  echo "Directory: $pictures directory doesn't exist."
  echo
  echo "Creating directory \"Pictures\"...";
  mkdir $pictures
#mv *.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP,ico,ICO,tiff,TIFF,gif,GIF} $pictures
fi


##documents
if [ -d "$douments" ]; then
  echo "Directory: $documents exist";
#mv *.{txt,TXT,doc,DOC,docx,DOCX,rtf,RTF,pdf,PDF} $documents
else
  echo "Directory: $documents doesn't exist."
  echo
  echo "Creating directory \"Documents\"...";
  mkdir $documents
#mv *.{txt,TXT,doc,DOC,docx,DOCX,rtf,RTF,pdf,PDF} $documents
fi


##video
if [ -d "$video" ]; then
  echo "Directory: $video exist";
#mv *.{mp4,MP4,mpeg,MPEG,mov,MOV,flv,FLV,mpg,MPG} $videos
else
  echo "Directory: $video directory doesn't exist."
  echo
  echo "Creating directory \"Videos\"...";
  mkdir $video
#mv *.{mp4,MP4,mpeg,MPEG,mov,MOV,flv,FLV,mpg,MPG} $videos
fi


##music
if [ -d "$music" ]; then
  echo "Directory: $music exist";
#mv *.{MP3,mp3,wav,WAV,aiff,AIFF,au,AU,acc,ACC,wma,WMA,MIDI,midi,ogg,OGG,m4a,M4A,ape,APE,WV,wv,alac,ALAC,flac,FLAC,tta,TTA} $music
else
  echo "Directory: $music directory doesn't exist."
  echo
  echo "Creating directory \"Music\"...";
  mkdir $music
#mv *.{MP3,mp3,wav,WAV,aiff,AIFF,au,AU,acc,ACC,wma,WMA,MIDI,midi,ogg,OGG,m4a,M4A,ape,APE,WV,wv,alac,ALAC,flac,FLAC,tta,TTA} $music
fi
