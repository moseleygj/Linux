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
gpg --yes --batch --passphrase=$PASSPHRASE -c BACKUP

#upload files
#remove files
#remove browser history
#clear last used commands
#remove script(self destruct)
