for x in $(ls *.webp)
do
 echo Changing: $x
 mv $x ${x%.webp}.jpg
done
