

#!/usr/bin/bash
#Name:		Linux Automation project
#purpose:	Add User Account
#author:	Gordon Moseley
#-------------------------------------------------------------------
#Enter a username 
clear

if [[ $UID != 0 ]]; then
    echo "You don't have sufficient privileges to run this script."
    exit 1

fi
echo "Enter a new user name, followed by [ENTER]:";
read name
#check if empty
user_length=$(echo -n $name | wc -c);
  if [ $name = "" ];then
  echo "username \"$name\" is NOT valid[EMPTY].";

elif [ "$user_length" -lt 6 ];then
	echo "username: $name ,is too short. Try 6-32 charcters."
	#check for invalid length
elif [ "$user_length" -gt 32 ];then
	echo "username: $name , is too long."
	#check for invalid characters
elif [[ $name == *['!'@#\$%^\&*()_+]* ]]
then
  echo "Your username contains invalid charcaters."
  else
clear
  echo "username  \"$name\" :	VALID";
  fi
 #check if username exist already
 # $(awk -F':' '{ print $1}' );
 
user_exists=$(id -u "$name" > /dev/null 2>&1; echo $?); 
 if [ $user_exists -eq "0" ]; then
 echo -e "username  \"$name\" :	NOT AVAILIBLE.";
 exit 0;
 else
 echo -e "username  \"$name\" :	AVAILIBLE.";
 fi
 #exit 0
 #create user
 #ask if user wants to use a custom directory
read -r -p "Do you want to create a custom user directory? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]];then
echo "Directory name: ";
read dir_name
 	if [ -d "$dir_name" ];then 
 	echo "$dir_name	.......	already exist!";
 	else
 		echo "Directory non-existant... Creating Directory ... $dir_name$name";
 	fi
#check if directory name is good, or currently exist
else 
    echo "Default directory will be used:	.......	/home/$name"
fi




#custom UID
#custom GID
#rights 
while true; do
    read -p "Create a custom User ID (UID) [y/n]:" yn
    case $yn in
        [Yy]* ) echo "Enter UID: ";read uid;break;;
        [Nn]* ) echo "Using the default UID...";;
        * ) echo "Please answer yes or no.";;
    esac
done
