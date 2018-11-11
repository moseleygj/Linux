#!/bin/bash
USERNAME="moseleygj"
EMAIL="moseleygj@gmail.com"
REPOS=(WebPages.git WebPages.git java-programming.git UI.git PHP.git DB.git)
clear

#check if directory exist
if [ -d GH ]; then
echo "Error: Directory 'GH' already exist. Please remove or rename you existing 'GH' directory."
exit 1 #change this to not exit terminal
else
#create and use directory
echo "creating directory GH..."
mkdir GH
cd GH
fi
#Check for package-manager
if [ -e /usr/bin/dnf ]; then
echo "DNF package-manager is present. Beginning download..."
sudo dnf install -y git
elif [ -e /usr/bin/yum ]; then
echo "YUM package-manager is present. Beginning download..."
sudo yum install -y  git
elif [ -e /usr/bin/apt ]; then
echo "APT package-manager is present. Beginning download..."
sudo apt-get install -y git
else
echo "Error: No package-manager found."
fi

git config --global user.name "${USERNAME}"
git config --global user.email "${EMAIL}"

for repo in ${REPOS[*]}
do 
git clone https://github.com/${USERNAME}/$repo
done
