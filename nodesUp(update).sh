#!/bin/bash
#check if nmap is installed
#Request local network from user
#echo "Enter your local network:"
read $localNetworkSelf
localNetwork = $(echo $localNetworkSelf | cut -d "." -f1-3)
localNetwork +=".0/24"
echo $localNetwork
