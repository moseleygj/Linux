clear
if [ -d "$HOME" ]; 
then echo "Directory Exist:$HOME:   Good"
else
echo "Directory Doesn't Exist:$HOME: (ERROR: Check your script)"
exit
fi
if [ -d "/home/$USER/backup" ]; 
then echo "Directory Exist:/home/$USER/backup:      Good"
else
echo "Directory Doesn't Exist:/home/$USER/backup: (ERROR: Check your script)"
exit
fi
if [ -d "/home/$USER/Downloads/" ]; 
then echo "Directory Exist:/home/$USER/Downloads/:      Good"
else
echo "Directory Doesn't Exist:/home/$USER/Downloads/: (ERROR: Check your script)"
exit
fi
sleep 3
TIME=`date +%b-%d-%y`
FILENAME=BACKUP-$TIME
echo "-------------------------------------";
echo "Now generating backup: Please wait...";
echo "-------------------------------------";
tar cvfz /home/$USER/Downloads/$FILENAME.tar.gz /home/$USER/ --exclude=/home/$USER/Downloads --exclude=/home/$USER/backup --exclude=/home/$USER/.cache --exclude=.* --exclude=/home/ieatpcs/Calibre\ Library

echo "----------------------------------------";
echo "Backup-`date +%b-%d-%y`".tar.gz: Complete;
echo "----------------------------------------";
