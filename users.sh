#!/usr/bin/bash
#Name:    Linux Automation project
#purpose: Add User Account
#author:  Gordon Moseley
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
  echo "username  \"$name\" : VALID";
  fi
 #check if username exist already
 # $(awk -F':' '{ print $1}' );
 
user_exists=$(id -u "$name" > /dev/null 2>&1; echo $?); 
 if [ $user_exists -eq "0" ]; then
 echo -e "username  \"$name\" : NOT AVAILIBLE.";
 exit 0;
 else
 echo -e "username  \"$name\" : AVAILIBLE.";
 fi
 
 #ask if user wants to use a custom directory
 #[-m]

while true; do
    read -p "Do you want to create a custom user directory? [Y/N]:" response
    case $response in
        [Yy]* ) echo "Directory name: ";read dir_name;break;;
        [Nn]* ) echo "Default directory will be used: ....... /home/$name";break;;
        [qQ]* )  echo "Quiting";break;return 0;;

        * ) echo "Please answer Yes or No.";;
    esac
done

#custom UID  [-u UID]
while true; do
    read -p "Create a custom User ID (UID) [Y/N]:" yn
    case $yn in
        [Yy]* ) echo "Enter UID: ";read uid;break;;
        [Nn]* ) echo "Using the default UID...";break;;
        * ) echo "Please answer Yes or No.";;
    esac
done

#custom [GID -g group]
while true; do
    read -p "Create a custom Group ID (GID) [Y/N]:" groupid_ans
    case $groupid_ans in
        [Yy]* ) echo "The group name or number of the user's initial login group.(GID): ";read uid;break;;
        [Nn]* ) echo "Using the default GID...";break;;
        * ) echo "Please answer Yes or No.";;
    esac
done
#Label/comment/name to identify account [-c comment]
while true; do
    read -p "Enter your name  to identify account (optional)[Y/N]:" full_name1
    case $full_name1 in
        [Yy]* ) echo "Enter Your FULL name: ";read FirstLastName;echo "Using name: $full_name, to identify your account."; break;;
        [Nn]* ) echo "Skipping task...";break;;
        * ) echo "Please answer Yes or No.";;
    esac
done
#expiration [-e date]
while true; do
    read -p "Custom experation date [Y/N]:" expiration_ans
    case $expiration_ans in
        [Yy]* ) echo "Enter account exiration date in YYYY-MM-DD format: ";read expir_date; break;;
        [Nn]* ) echo "Skipping task...";break;;
        * ) echo "Please answer Yes or No.";;
    esac
done
#Add use to Groups [-F, --groups group1,group2,group3]
while true; do
    read -p "Add user to groups[Y/N]:" groups_ans
    case $groups_ans in
        [Yy]* ) echo "Enter groups for user to join. Each group is separated from the next by a comma, with no
           intervening whitespace.";read groups_add; break;;
        [Nn]* ) echo "Skipping task...";break;;
        * ) echo "Please answer Yes or No.";;
    esac
done

#create password
#sudo passwd $name 
