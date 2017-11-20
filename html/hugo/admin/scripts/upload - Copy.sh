#!/bin/sh
#uploads_dir="./uploads/"
echo "Content-type: text/html"
echo ""
#echo "$CONTENT_LENGTH"
path=/home/ain/pCloudDrive/html/hugo/admin/img

echo `dirname $0`


case "$REQUEST_METHOD" in
  POST)
 # ls
  #tmpfile=`mktemp --tmpdir=./tmp`
 # echo $tmpfile
  data=`cat`
  TMPOUT="uploadfile"
  
  #cat >$TMPOUT
  #sed -e '1,4d' -e '$d' >$TMPOUT
 #sed -e '1,4d' -e '$d'  
  
  #ls
  #cat $tmpfile
  ;;
    *)
    echo 'Status: 405 Method Not Allowed'
    echo
    ;;
esac

echo "<br>"
file=`echo "$data"|sed -r -n 's/(.*)filename="([^"].*[^"])".$/\2/p'`
echo $file

if [ -f $path"/"$file ]
then
echo 'file exists'
echo '<br>'
echo 'change filename'
exit

fi







echo "<br>"
echo $data  >  $path"/x"$file
echo "<br>"
data=`echo "$data"|sed -e '1,4d' -e '$d'`  
echo $data
echo $data >  $path"/"$file

#rename to filename
 # tmpdir=./tmp
 #text=`sh ocr.sh $tmpfile $tmpdir`

#echo $tmpfile
