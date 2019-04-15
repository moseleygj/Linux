   #!/bin/bash
   clear
   echo "MP3 download by Genere automater"
   echo "-------------------------------------"
           OPTIONS="RnB_Rap Jazz Rock Classical Reggae_Danehall Billboard_Top_100  Quit"
           select opt in $OPTIONS; do
               if [ "$opt" = "RnB_Rap" ]; then
                echo " call Rap_RnB"
               elif [ "$opt" = "Jazz" ]; then
                echo "call jazz"
                eval sh searchPlaylist.sh
                 elif [ "$opt" = "Rock" ]; then
                echo "call rock"
                eval sh mp3.sh
                 elif [ "$opt" = "Classical" ]; then
                echo "call classical..."
                elif [ "$opt" = "Reggae_Danehall" ]; then
                echo "call Reggae..."
                elif [ "$opt" = "Billboard_Top_100" ]; then
                echo "Top 100 Billboard"
                elif [ "$opt" = "Quit" ]; then
                echo "call Quit..."
                eval sh billboard100.sh
                exit
                  else
                clear
                echo "bad option"
               fi
           done