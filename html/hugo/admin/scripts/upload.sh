#!/bin/sh
#uploads_dir="./uploads/"
echo "Content-type: text/html"
echo ""
#echo "$CONTENT_LENGTH"
path=/home/ain/pCloudDrive/html/hugo/admin/img

#echo `dirname $0`


case "$REQUEST_METHOD" in
  POST)
  TMPOUT=$path"/tmpfile"
  #ls $path
  cat >$TMPOUT
data=`cat $TMPOUT`
  # Get the line count
  LINES=$(wc -l $TMPOUT | cut -d ' ' -f 1)

  # Remove the first four lines
  tail -$((LINES - 4)) $TMPOUT >$TMPOUT.1

  # Remove the last line
  head -$((LINES - 5)) $TMPOUT.1 >$TMPOUT

  # Copy everything but the new last line to a temporary file
  head -$((LINES - 6)) $TMPOUT >$TMPOUT.1

  # Copy the new last line but remove trailing \r\n
  tail -1 $TMPOUT | sed -p -i -e 's/\r\n$//' >>$TMPOUT.1
   # tail -1 $TMPOUT | perl -p -i -e 's/\r\n$//' >>$TMPOUT.1
esac
 
echo "<br>"
file=`echo "$data"|sed -r -n 's/(.*)filename="([^"].*[^"])".$/\2/p'`
#echo $file

if [ -f $path"/"$file ]
then
echo 'file exists'
echo '<br>'
echo 'change filename of uploaded file'
exit
else

:
mv "$TMPOUT"".1" $path"/"$file

fi
