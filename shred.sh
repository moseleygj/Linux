#!/bin/bash

HOME_FOLDER=TheSafe;
BACKUP=TheSafe.tar.gz;
PASSPHRASE=password; #you might want to change this...

#lock screen
xdg-screensaver lock

if [ -d $HOME_FOLDER ]; then
rm -r $HOME_FOLDER
fi

mkdir $HOME_FOLDER

#COMPRESS FILES
##COPY files into $HOME_FOLDER first
##!!REMEMBER: to copy files into $HOME_FOLDER on this line!!!
tar -czvf theSafe.tar.gz $HOME_FOLDER

#ENCRYPT THE COMPRESSED FILE
gpg --yes --batch --passphrase=$PASSPHRASE -c $BACKUP

#upload files

HOST='ftp.host.com'
USER='username'
PASSWD='password'

ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
prompt
cd htdocs
ls -la
bye
EOT

# REMOVE THE UNENCRYPTED FILE; mv BACKUP>/dev/null
rm $BACKUP
#remove browser history

#clear last used commands
history -c
#remove script(self destruct)
#This file should be named "shred.sh".

touch sd.sh
echo "rm shred.sh" > sd.sh;
sh sd.sh
#clear your history again
history -c
