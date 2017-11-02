#!/bin/bash

HOME_FOLDER=TheSafe;
BACKUP=TheSafe.tar.gz;
PASSPHRASE=password;

#lock screen
xdg-screensaver lock

if [ -d $HOME_FOLDER ]; then
rm -r $HOME_FOLDER
fi

mkdir $HOME_FOLDER

#compress files
tar cvf theSafe.tar $HOME_FOLDER

#encrypt files
gpg --yes --batch --passphrase=$PASSPHRASE -c $BACKUP

#upload files
#remove files
rm $BACKUP
#remove browser history
#clear last used commands
history -c
#remove script(self destruct)
touch sd.sh
echo "rm shred.sh" > sd.sh;
sh sd.sh
