#!/bin/bash
killProc(){
echo "Content-type: text/html"
echo ""
procname=$1
procs=`ps cax | grep $procname`
if [ $? -eq 0 ]; then
echo "$procs"
echo "proces is running and going to stop"
IFS='
'
for proc in $procs
do
IFS=' '
for id in $proc
do

echo $id
kill $id
break

done

done

else
x=0

fi

}

checkFile(){
	
file=~/$1
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
cp hugo $file
chmod +x $file
fi	
	
}

#run remote script
#curl http://foo.com/script.sh | bash -s arg1 arg2

echo "Content-type: text/html"
echo ""
rm h
rm p
rm docs
ln -s pCloudDrive/vagelis/caddy/hugo/test/content/post h
ln -s pCloudDrive/html p
ln -s /home/ain/pCloudDrive/docs docs
cd p 
# p is soft link to pCloudDrive/html
#



#########

checkFile caddy
checkFile hugo
checkFile pcloudcc

killProc caddy
killProc hugo
killProc pcloudcc
#########


echo evagelosvar |  ~/pcloudcc -u evagelosvar@gmail.com -p -d&

sleep 5

#cd ~/pCloudDrive/html/hugo/gymnasioker4

#~/hugo server --bind=0.0.0.0 --baseUrl=http://gymnasioker4.graeca.tk:1313/ -D -F&

#cd ~/pCloudDrive/html/hugo/mama

#~/hugo server --bind=0.0.0.0 --baseUrl=http://gymnasioker4.graeca.tk:1314/ -D -F&
###cd ~/pCloudDrive/html/hugo/gymnasioker4  
###~/hugo
#sh pCloudDrive/cmd2.sh

~/caddy -conf  ~/p/CaddyfilePatrologia&
#~/caddy -conf  ~/p/Caddyfile&
###~/caddy -conf  ~/p/CaddyfileHugo&
#~/caddy -conf  ~/p/CaddyfileGymnasioker4&
