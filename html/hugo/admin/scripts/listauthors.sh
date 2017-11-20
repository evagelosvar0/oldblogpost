#!/bin/bash
echo "Content-type: text/html"
echo ''
path=/home/ain/pCloudDrive/html/hugo/admin/articles
file=posts/eleni/ttt.md

dir=`echo "$file" | sed -r 's!/[^/]*$!!g'`
 
#echo $dir



for post in `ls $path"/"$dir`
do
#echo $post

pathfile="$dir""/""$post"
linktoedit='<a class="editlink" target="_blank" href="'\
"/hugo/admin/scripts/edit.sh?file=""$pathfile""&cmd=open"'">'"$post"'</a>'

echo "...Click to edit Post...""$linktoedit"
echo "<br>"
done
