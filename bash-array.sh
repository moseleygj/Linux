clear
IFS=$'\n'       # make newlines the only separator
echo "# :    Mount   GB";
echo "-------------------";

counter=0
array=( `sudo fdisk -l| grep 'Disk /dev/s' | sed s/Disk// | cut -d ' ' -f2-3 | sed s/,//|sed s/://`)
for i in "${array[@]}"
do
       counter=$((counter+1));
      
echo "$counter : $i";	
   done

   echo "";

while true; do
    read -p "Enter a HDD number to write to: " drive_num
    case $drive_num in
        [2]* ) echo "You will be using HDD 2: ${array[1]} GB";break;;
        [3]* ) echo "You will be using HDD 3: ${array[2]} GB";break;;
        [4]* ) echo "You will be using HDD 4: ${array[3]} GB";break;;
        [5]* ) echo "You will be using HDD 5: ${array[4]} GB";break;;
        [6]* ) echo "You will be using HDD 6: ${array[5]} GB";break;;
        [7]* ) echo "You will be using HDD 7: ${array[6]} GB";break;;
        [8]* ) echo "You will be using HDD 8: ${array[7]} GB";break;;
        [9]* ) echo "You will be using HDD 9: ${array[8]} GB";break;;      
        * ) echo "Enter a HDD # other than HDD 1: ${array[0]}";;
     esac
done
((drive_num--))
echo "HDD:  ${array[ $drive_num ]}";

if [[ -z  ${array[$drive_num]} ]];then
	echo "Empty/Invalid...¯\_(ツ)_/¯...bye!";exit 0;
else
	echo "(•‿•) Good HDD selection!";
fi


#echo ${array[$drive_num]}

#echo "-------------------------------"
#counterA=0
#array1=( `sudo fdisk -l| grep 'Disk /dev/s' | sed s/Disk// | cut -d ' ' -f3 | sed s/,//|sed s/://`)
#for j in "${array1[@]}"
#do
#       counterA=$((counterA+1));
#echo $j | awk '{printf("%d\n",$0+=$0<0?-0.5:0.5)}'
#echo "$counterA : $j";
#	
#   done


# 
#echo "---------------------------------------";
#var_name=()
#for i in {1..10}; do
#   echo var_name[$i]="Field $i of the list";
#done
#declare -p var_name
#echo "Field 5 is: ${var_name[5]}";


#echo "---------------------------------------";
#var_nameA=()
#for j in {`ls`}; do
#   echo var_nameA[$j]="Field $i of the list";
#done
#declare -p var_name
#echo "Field 5 is: ${var_name[5]}"
#*/
