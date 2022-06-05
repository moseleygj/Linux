#/usr/bin/bash
sudo nmap -sP 192.168.1.0/24|awk '/^Nmap/{ip=$NF}/00:C0:CA/{print ip}';sudo nmap -sP 192.168.1.0/24|awk '/^Nmap/{ip=$NF}/6A:4C:BF/{print ip}';sudo nmap -sP 192.168.1.0/24|awk '/^Nmap/{ip=$NF}/BE:47:F2/{print ip}';
