#!/usr/bin/bash
#Name:    nodesUp
#purpose: show nodes, IPs and MAC Address
#author:  Gordon Moseley
#-------------------------------------------------------------------
clear
#CHECK IF NMAP SCANNER IS INSTALLED
if [ -e /usr/bin/nmap ]; then
echo "NMap is installed!"
else
echo "You need to install NMap."
	if [ -e /usr/bin/dnf ]; then
	sudo dnf install -y nmap
	elif [ -e /usr/bin/apt ]; then
	sudo apt-get install -y nmap
	elif [ -e /usr/bin/yum ]; then
	sudo yum install -y nmap
	else
	echo "Error: Package manager isn't present: yum, dnf or apt. If you use a different package manager please configure this script accordingly."
	fi
fi

#LIST NETWORK IP ADDRESS AVAILIBLE
ipArr=()
for ips in  $(ifconfig|grep -w inet|cut -d " " -f10);
do
if [ $ips = "127.0.0.1" ]; then
	ipArr+=("127.0.0.1 (N/A)");
else
	ipArr+=($ips);
fi
done
#GENERATE NUMBER FOR USER TO SELECT APPROPRIATE IP ADDRESS
echo "";
echo "Select the number for for the IP of your network"
echo "------------------------------------------------"
d=0;
for i in "${ipArr[@]}";
do

echo "$d =" $i;
 let d+=1;
done

#AWAIT USERS INPUT
echo "Enter your local network: "

read MyLocAddr
if [ $MyLocAddr -eq 0 ]; then
echo "using IP(0): "${ipArr[$MyLocAddr]};
elif [ $MyLocAddr -eq 1 ]; then
echo "using IP(1) "${ipArr[$MyLocAddr]};
elif [ $MyLocAddr -eq 2 ]; then
echo "using IP(2) "${ipArr[$MyLocAddr]};
elif [ $MyLocAddr -eq 3 ]; then
echo "using IP(3) "${ipArr[$MyLocAddr]};
else 
echo "Error: Number $MyLocAddr not found! ";
fi
#DISASSEMBLE AND REASSEMBLE NETWORK ADDRESS FOR FURTHER PROCESSING
localNetwork=$(echo ${ipArr[$MyLocAddr]} | cut -d "." -f1-3)
localNetwork+=".0/24"

#RUN NMAP SCAN AND DISPLAY CLEAN RESULTS
sudo nmap -sn $localNetwork | grep -v "Host is up" | sed "s/Nmap scan report for //"|grep -v "Staring Nmap" | grep -v "Nmap done" | grep -v "Starting Nmap" | sed "s/MAC Address:/MAC:/g" | grep -v `hostname`
