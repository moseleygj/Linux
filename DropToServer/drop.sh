#!/usr/bin/bash
REF_FILE="refHost.txt"

send_data()
{
	HOST_REMOTE=$(cat $REF_FILE|sed -n '1p')
	USER_NAME=$(cat $REF_FILE|sed -n '2p')
	REMOTE_DIR=$(cat $REF_FILE|sed -n '3p')
	echo "Checking $HOST_REMOTE's Connection..."
	ping -c 3 $HOST_REMOTE &>/dev/null

		if [ "$?" -eq 1 ];then
			echo "$HOST_REMOTE is ONLINE."
				#check if port is open
				nc -zv $HOST_REMOTE 80 8080 &> /dev/null
				

				if [ "$?" -eq 0 ];then
					echo "Checking established..."
					#CONNECT TO HOST VIA SCP
					#scp -r $USER_NAME@$HOST_REMOTE:$REMOTE_DIR
				else 
					echo "Connection to $HOST_REMOTE REFUSED!"
					exit
		fi


		elif [ "$?" -eq 0 ];then
			echo "$HOST_REMOTE is OFFLINE"
		fi
}
 
create_file()
{	
	echo "Reference file doesn't exist."
	echo "Creating reference file..."
	touch $REF_FILE
	echo "$REF_FILE successfully created."

	echo "HOSTNAME or IP ADDRESS:"
	read HOST_REMOTE
	echo $HOST_REMOTE > $REF_FILE
	echo "Enter user name:"
	read USER_NAME
	echo $USER_NAME >> $REF_FILE
	echo "relative path of remote directory:"
	read REMOTE_DIR
}


if [ -e $REF_FILE ];then
send_data
elif [ ! -e $REF_FILE ];then
create_file
fi

