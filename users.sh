#!/bin/bash
#Name:Linux Automation project
#purpose: Add User Account
#author: Gordon Moseley
#-------------------------------------------------------------------

#Enter a username 
echo "Enter a new user name, followed by [ENTER]:"
read name
#check if empty
  if [$name = ""];then
  echo "username is NOT valid.";
  else
  echo "username is good.";
  fi
 #check if username exist already
 # $(awk -F':' '{ print $1}' );
 
 user_exists=$(id -u user > /dev/null 2>&1; echo $?) 
 
 echo $user_exists;
 
 #create user
 
 #group
 
 #rights 
