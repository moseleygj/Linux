
#!/usr/bin/bash
#Name:		Linux Automation project
#purpose:	Add User Account
#author:	Gordon Moseley
#-------------------------------------------------------------------
#Enter a username 
clear


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
  echo "username  \"$name\" is valid.";
  fi


 #check if username exist already
 # $(awk -F':' '{ print $1}' );
 
user_exists=$(id -u "$name" > /dev/null 2>&1; echo $?); 
 if [ $user_exists -eq "0" ]; then
 echo "username  \"$name\" : NOT AVAILIBLE.";
 else
 echo "username  \"$name\" :  AVAILIBLE.";
 fi
 exit 0
 #create user
 
 #group
 
#rights 
