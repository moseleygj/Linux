#check os

#if ! command -v dnf
#then
#  echo "command DNF not found"
#else
#  echo "REDHAT-based system"
#fi
#
#if ! command -v apt
#then
#  echo "command APT not found"
#else
#   echo "Debian-based system"
#fi

clear
if ! [ -x "$(command -v apt)" ]; then
  echo 'ERROR: "APT" is not installed.'
  echo "REDHAT-based system(REDHAT/FEDORA/CentOS)"

elif ! [ -x "$(command -v yum)" ]; then
  echo 'ERROR: "YUM" is not installed.'
  echo "Debian-baded system(Debian/Ubuntu)"

fi
