#!/bin/bash
#Check status of a node
#Gordon Moseley
#9/2017

clear

echo "IP address: "
read IP
NO="Host [$IP] . . . . . .  OFFLINE!";
YES="Host [$IP] . . . . . . ACTIVE!";
duration=10;
if [ "$IP" == "" ]; then
echo "Error - Invalid Input!"
exit 0
fi

doWork()
{
if  ping -c 2 $IP &> /dev/null
then
clear
	echo "Host [$IP] . . . . . . . . . . . . . . . . Active!"
	echo ""
	echo ""
  	zenity --info --text="$YES" 2> /dev/null
sleep $duration
doWork

else

clear
  echo "Host [$IP] . . . . . . . . . . . . . . . . No route to host" #0 reachable.2 unreachable
  echo ""
  echo ""
  zenity --warning --text="$NO" 2> /dev/null
  sleep $duration
  doWork
fi
}

doWork
