clear

IFS=$'\n'       # make newlines the only separator
for j in $(sudo fdisk -l| grep 'Disk /dev/s' | sed s/Disk// | cut -d ' ' -f1-4|sed s/,//)    
do
    c=$(($c+1));
    echo "Drive $c: $j";
done