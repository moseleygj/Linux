


#check if user is root
#ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
echo "you must be root in order to run this script."
fi
clear
echo -e "\033[1mWelcome,\033[0m" "`whoami`!\t\t\t\t\t\t""\033[1mDate:\033[0m" "`date`"
echo "" #Making Text Bold "echo -e "\033[1mYOUR_TEXT_HERE\033[0m"
echo -e "\033[4m\033[1m\t\t\t\tSTAUS:\033[0m"
#----
echo -e "\033[1m\E[33;32mActive User:\033[0m . . . . . . . . . . . . . . . : $LOGNAME"
echo -e "\033[1m\E[33;32mShell-Type:\033[0m  . . . . . . . . . . . . . . . : $SHELL"
echo -e "\033[1m\E[33;32mDirectory(CURRENT):\033[0m. . . . . . . . . . . . : $PWD"	"\033[1m\E[33;32m\t(LAST): $OLDPWD\033[0m"
echo -e "\033[1m\E[37;33mUser(s) Logged-In:\033[0m . . . . . . . . . . . . : `who|wc -l;who`" 

echo -e "\033[1m\E[37;33mSystem Up-Time:\033[0m	     `uptime`"

echo ""
echo -e "\033[1m\E[37;33m=================================================================";tput sgr0;
#---
echo ""
echo -e "\033[1m\E[33;37mYour shell's search PATH: \033[0m$PATH"	
echo "------------------------------------------------"
echo "*NOTE: To add a PATH (e.g. /usr/bin/)"
echo "Type: PATH=$PATH:/usr/bin"
echo "To make changes permanent modify:	 ~/.bash_profile"
echo -e "\033[1m\E[33;37mThe path to your eMail is: \033[0m$MAIL" #write script to assign [NONE] is none is
echo -e "\033[1m\E[37;33m=================================================================";tput sgr0;
echo ""

echo -e "\033[1m\E[37;33mCurrent Jobs:\033[0m . . . . . . . . . . . . . . . : [NONE]$JOBS" #write script to assign [NONE] is none is present" 
echo -e "\033[1m\E[37;33mProcessing Running:\033[0m"; tput sgr0;
echo "`ps`";
echo -e "\033[1m\E[37;35mKernel:\033[0m . . . . . . . . . . . . . . . . . . : " "`uname -sr`"
echo -e "\033[1m\E[33;36mGCC Compiler Status:\t\t\t      \033[0m" "\033[1m\E[33;36mVersion: \033[0m`gcc --version|grep GCC`" #check status script
echo -e "\033[1m\E[37;33mDisk Characteristics:\033[0m";echo "`df -H`"
echo " "

echo -e "\033[1m\E[37;32mHost Name: \033[0m"" . . . . . . . . . . . . . . . . : `hostname`"
main()
{
ping -c 3 google.com > /dev/null		#Ping Google
if [ "$?" -eq 0 ]				#Check if data was presented, if not connection if dead.	
then
	echo -e "\033[1m\E[37;32mInternet Connection: \033[0m"" . . . . . . . . . . . : [ALIVE!]";
	#zenity --info --text "Internet Active!";	#display Internet Successful Message

else
	echo -e "\033[1m\E[37;32mInternet Connection: \033[0m""[DEAD!]";   
	#zenity --error --text "Internet Dead, Retrying"		#display No Internet Message
sleep 3					#Wait 3 secs before continuing the loop
        main					#Go to the function main()
    fi						#end if statement
}

main

echo -e "\033[1m\E[37;32mYour Public IP Address:\033[0m"" . . . . . . . . . . : `wget -q http://www.whatismyip.com/automation/n09230945.asp -O - && echo`"
echo -e "\033[1m\E[37;32mOpen ports:\033[0m"; echo "`nmap 127.0.0.1|grep open`"



#if [-f /usr/bin/gcc ]
#then
#echo GCC exist!
#fi
