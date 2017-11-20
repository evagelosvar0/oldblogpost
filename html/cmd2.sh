#!/bin/bash
#cd pCloudDrive/caddy/mysites/hugo/mama
#/home/ain/hugo server --bind=0.0.0.0 --baseUrl=http://graeca.tk:1313/ -D -F

#cron -e
#ps cax | grep pcloudcc > /dev/null
#cp /home/ain/pCloudDrive/vagelis/caddy/hugo/test/content/post/old-posts.md post

# csplit -f x/cob post '/@@@/' {*}
#rename 's/(^fff.*$)/\1\.md/' *

proc=`ps cax | grep pcloudcc`
if [ $? -eq 0 ]; then
echo $proc
echo "proces is running and going to stop"
for i in $proc
do
echo $i
kill $i
break
done

else
x=0

fi
proc=`ps cax | grep hugo`
if [ $? -eq 0 ]; then
echo $proc
echo "proces is running and going to stop"
for i in $proc
do
echo $i
kill $i
break
done

else
x=0

fi
