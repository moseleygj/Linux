#!/bin/bash
clear
echo "Starting the show ."
sleep 1


for i in {100..115}
do
ip="192.168.1.$i"


echo "------------------------------"
ping -c 1 -w 1 $ip > /dev/null
result=$(echo $?);
echo "HOSTNAME: `host $ip|grep "domain name pointer"|cut -d" " -f5`"
hn=$(host $ip|grep "domain name pointer"|cut -d" " -f5)
echo -e "IP : $ip"
#arp -a ip
#echo $hn "<==Hostname  result"
if [ $hn ]; then
echo -e "STATUS: \t \033[92mAlive 😊✔️\033[39m"
else
echo -e "STATUS: \t \033[91mDead ☠️ ✖️\033[39m"
fi

done

#[ $result -eq 0 ] && 

