#!/bin/sh
echo "Content-type: text/html"
echo ''
ls
pathscripts=/home/ain/pCloudDrive/html/hugo/admin/scripts
sh $pathscripts/list.sh &
