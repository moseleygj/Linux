#list drives neatly
sudo fdisk -l| grep 'Disk /dev/s' | sed s/Disk// | cut -d ' ' -f2-4 | sed s/,//|sed s/://
