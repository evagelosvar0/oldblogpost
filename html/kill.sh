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
killProc caddy
