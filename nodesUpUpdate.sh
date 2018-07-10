#!/bin/bash
#check if nmap is installed
if [ -e /usr/bin/nmap ]; then
echo "nmap is installed!"
else
echo "You need to install nmap."
	if [ -e /usr/bin/dnf ]; then
	sudo dnf install -y nmap
	elif [ -e /usr/bin/apt ]; then
	sudo apt-get install -y nmap
	elif [ -e /usr/bin/yum ]; then
	sudo yum install -y nmap
	else
	echo "Error: packagmage manager isn't: yum, dnf or apt"
	fi
fi
#Request local network from user
echo "Enter your local network: "
read MyLocAddr
localNetwork=$(echo $MyLocAddr | cut -d "." -f1-3)
localNetwork+=".0/24"
sudo nmap -sn $localNetwork | grep -v "Host is up"|sed "s/Nmap scan report for //"|grep -v "Staring Nmap"|grep -v "Nmap done"|grep -v "Starting Nmap"|sed "s/MAC Address:/MAC:/g"|grep -v `hostname`
