#!/bin/bash
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
