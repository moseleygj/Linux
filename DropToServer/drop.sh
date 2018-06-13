#!/usr/bin/bash


echo "HOSTNAME or IP ADDRESS:";
read HOST_REMOTE
echo "Checking $HOST_REMOTE's Connection"
ping -c 3 $HOST_REMOTE &>/dev/null

if [ "$?" -eq 1 ];then
	echo "$HOST_REMOTE is ONLINE.";
elif [ "$?" -eq 0 ];then
	echo "$HOST_REMOTE is OFFLINE"

fi


