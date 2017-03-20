#!/bin/bash
#Name:Linux Automation project
#purpose: Add User Account
#author: Gordon Moseley
#-------------------------------------------------------------------

#Enter a username 
echo "Enter a new user name, followed by [ENTER]:"
read name
  
 #check if username exist
 awk -F':' '{ print $1}' /etc/passwd #list usernames ine /etc/passwd
 
 #create user
 
 #group
 
 #rights
 