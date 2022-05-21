clear
for x in $(ls *.webp)
do
 echo Converting: $x
 mv $x ${x%.webp}.jpg
 echo "Removing old file..."
 rm $x
done

echo "Done!"
#rename and remove old files
