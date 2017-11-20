#!/bin/sh
echo "Content-type: text/html"
echo ''


#echo $REMOTE_USER
#ls
#echo `dirname $0`
webpath=hugo/admin/scripts
#sh $pathscripts"/edit.sh?file=gymnasioker4.github.io-master/lessons/markdown/xhmeia-tetramhnou-c.md&cmd=open"


link="/hugo/admin/scripts/edit.sh?file=gymnasioker4.github.io-master/$REMOTE_USER/test.md&cmd=open"

linktoedit='<a class="editlink" target="_blank" href="'\
"$link""&cmd=open"'">'"POSTS"'</a>'

echo "...Go to your Posts...<br>USER: ""$REMOTE_USER""___""$linktoedit"
echo "<br>"
