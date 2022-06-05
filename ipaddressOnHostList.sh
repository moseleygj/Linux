#!/usr/bin/bash

ipArr=()
#iterate through all IP address on current system
for ips in  $(ifconfig|grep -w inet|cut -d " " -f10);
do
	#add to ipArr Array
	ipArr+=($ips);
done

echo "IP Address on current host:"
echo "___________________________"
echo "ipArr0 =" ${ipArr[0]}
echo "ipArr1 =" ${ipArr[1]}
