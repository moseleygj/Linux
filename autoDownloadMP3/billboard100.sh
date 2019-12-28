   clear
   echo "Download Billboard Top 100 by YEAR"
   echo "-------------------------------------"
           OPTIONS="1990 91 92 93 94 95 96 97 98 99 00 01 02 03 04 05 06 07 09 10 11 12 13 14 15 16 17 18 2019   ALL QUIT"
           select opt in $OPTIONS; do
               if [ "$opt" = "Quit" ]; then
                echo exiting...
                exit
               elif [ "$opt" = "Create_Playlist_File" ]; then
                echo "call playlist"
                eval sh searchPlaylist.sh
                 elif [ "$opt" = "Search_MP3_single" ]; then
                echo "call searchMP3"
                eval sh mp3.sh
                elif [ "$opt" = "Download_Playlist_By_Word" ]; then
                echo "call genre..."
                elif [ "$opt" = "Download_By_Genre" ]; then
                eval sh downloadByGenre.sh
                  else
                clear
                echo "bad option"
               fi
           done