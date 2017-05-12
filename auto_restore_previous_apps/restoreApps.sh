LIST="$( cat apps-installed.txt )";  for s in $LIST; do dnf -y install $s 2>install-error.txt; done
