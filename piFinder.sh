#!/bin/bash

# Check for root privileges since Nmap layer-2 scanning requires it
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script with sudo."
  exit 1
fi

# Automatically detect the local subnet if no argument is passed
# (Falls back to 192.168.1.0/24 if it can't parse the interface)
SUBNET=${1:-$(ip route get 1 | awk '{print $7; exit}' | sed 's/\.[0-9]*$/\.0\/24/')}
clear
echo "Scanning subnet: $SUBNET for Raspberry Pis..."
echo "-------------------------------------------------------------------"
printf "%-18s %-25s %-20s\n" "IP ADDRESS" "HOSTNAME" "MAC ADDRESS"
echo "-------------------------------------------------------------------"

# Run Nmap and parse the blocks
sudo nmap -sn "$SUBNET" | awk '
  /Nmap scan report for/ {
    # Extract hostname and IP
    if ($0 ~ /\(/) {
      hostname = $5
      ip = $6
      gsub(/[()]/, "", ip)
    } else {
      hostname = "unknown"
      ip = $5
    }
  }
  /MAC Address:/ {
    mac = $3
    # Check if MAC matches Pi OUIs or vendor string contains Raspberry
    if (mac ~ /^(B8:27:EB|DC:A6:32|D8:3A:DD|2C:CF:67)/ || $0 ~ /[Rr]aspberry/) {
      printf "%-18s %-25s %-20s\n", ip, hostname, mac
      found=1
    }
  }
  END {
    if (!found) {
      print "No Raspberry Pi devices detected."
    }
  }
'
echo "-------------------------------------------------------------------"
