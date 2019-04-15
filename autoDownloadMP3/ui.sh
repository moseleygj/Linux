   #!/bin/bash
   clear
   echo "MP3 Youtube Download automater"
   echo "-------------------------------------"
           OPTIONS="Search_MP3_single Create_Playlist_File  Download_Playlist_By_Word  Download_By_Genre Quit"
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