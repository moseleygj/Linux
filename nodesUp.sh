#!/bin/bash
#remember to change the network to your network
clear;sudo nmap -sn 192.168.1.0/24|grep -v "Host is up"|sed "s/Nmap scan report for //"|grep -v "Staring Nmap"|grep -v "Nmap done"|grep -v "Starting Nmap"|sed "s/MAC Address:/MAC:/g"|grep -v `hostname`
