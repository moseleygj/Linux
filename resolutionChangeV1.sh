display=()
count=0
clear
echo "Display"
echo "--------"
for x in $(xrandr |cut -d " " -f 1-2|grep -w "connected"| cut -d " " -f1);
do
let count+=1;
display[$count]=$x
echo "$count: "${display[$count]}
done
echo ""
echo "Enter display number:"
read disNum

if [ $disNum = 1 ]; then
echo "option 1 selected"
elif [ $disNum = 2 ]; then
echo "option 2 selected"
elif [ $disNum = 3 ]; then
echo "option 3 selected"
elif [ $disNum = 4 ]; then
echo "option 4 selected"
elif [ $disNum = 5 ]; then
echo "option 5 selected"
elif [ $disNum = 6 ]; then
echo "option 6 selected"
else
echo "Error invalid option or too many monitors(>6)!"
fi


