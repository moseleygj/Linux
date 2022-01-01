#list directories
echo `ls -l|grep ^d|wc -l` Directories 🗁

#Bash Files
echo `ls -l|grep *.sh|wc -l` BASH files 🖳

#python
echo `ls -l|grep *.py|wc -l` python files 🐍

#Text Files
echo `ls -l|grep *.txt|wc -l` TEXT files

#Text Files
echo `ls -l|grep *.doc|wc -l` DOC files

#PDF Files
echo `ls -l|grep *.pdf|wc -l` PDF files

#photos
jpg=$((`ls -l|grep *.jpg|wc -l`))
png=$((`ls -l|grep *.png|wc -l`))
jpeg=$((`ls -l|grep *.jpeg|wc -l`))
gif=$((`ls -l|grep *.gif|wc -l`))
photos=$(($jpeg+$jpg+$png+$gif))
#Movies
mp4=$((`ls -l|grep *.mp4|wc -l`))
wmv=$((`ls -l|grep *.wmv|wc -l`))
mkv=$((`ls -l|grep *.mkv|wc -l`))
mov=$((`ls -l|grep *.mov|wc -l`))
flv=$((`ls -l|grep *.flv|wc -l`))
avi=$((`ls -l|grep *.avi|wc -l`))
webm=$((`ls -l|grep *.webm|wc -l`))
movies=$(($mp4+$wmv+$mkv+$mov+$flv+$avi+$webm))





#songs
echo `ls -l|grep *.mp3|wc -l` Music files 🎜


#Compressed Files
tars=$(( `ls -l|grep *.tar|wc -l`))
zips=$(( `ls -l|grep *.zip|wc -l` ))
gunzips=$((`ls -l|grep *.gz|wc -l`))
bzips=$((`ls -l|grep *.bz2|wc -l`))
xcs=$((`ls -l|grep *.xc|wc -l`))
rars=$((`ls -l|grep *.rar|wc -l`))


#PDF Files
compress=$(($zips+$tars+$gunzips+$bzips+$xcs+$rars))
echo $movies Movie files 🎬
echo $photos Photos files 🖻
echo $compress compressed files
