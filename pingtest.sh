#/bin/bash
clear

echo "IP address: "
read IP
no="Host [$IP] . . . . . .  OFFLINE!";
yes="Host [$IP] . . . . . . Active!";
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
  	zenity --info --text="$yes" 2> /dev/null
sleep 10
doWork

else
clear
  echo "Host [$IP] . . . . . . . . . . . . . . . . No route to host" #0 reachable.2 unreachable
  echo ""
  echo ""
  zenity --warning --text="$no" 2> /dev/null
  sleep 10
  doWork
fi
}

doWork