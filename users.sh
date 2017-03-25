#!/usr/bin/bash
#Name:		Linux Automation project
#purpose:	Add User Account
#author:	Gordon Moseley
#-------------------------------------------------------------------
PATH="$PATH":/usr/bin/
#Enter a username 
clear
echo "Enter a new user name, followed by [ENTER]:"
read name;
#check if empty
  if [$name -eq ""];then
  echo "username \"$name\" is NOT valid[EMPTY].";
  else
  echo "username  \"$name\" is valid.";
  fi
 #check if username exist already
 # $(awk -F':' '{ print $1}' );
 
user_exists=$(id -u "$name" > /dev/null 2>&1; echo $?); 
 if [$user_exists -eq "0"]; then
 echo "User name  \"$name\" : AVAILIBLE.";
 else
 echo "User name  \"$name\" : NOT AVAILIBLE.";
 fi
 echo $user_exists;
 exit 0
 #create user
 
 #group
 
 #rights 
