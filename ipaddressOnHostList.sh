ipArr=()
for ips in  $(ifconfig|grep -w inet|cut -d " " -f10);
do
	ipArr+=($ips);
done

echo "ipArr0 =" ${ipArr[0]}
echo "ipArr1 =" ${ipArr[1]}
