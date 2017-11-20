#!/bin/sh
echo "Content-type: text/html"
echo ''
echo `pwd`
echo `dirname $0`
path=/home/ain/pCloudDrive/html/hugo/admin/articles
linuxpath=/home/ain/pCloudDrive/html/hugo/admin/articles
webpath=/hugo/admin/articles
case "$REQUEST_METHOD" in
  POST)
  
 #echo "post"
	DATA=`cat`
  ;;
  GET)
  #echo "get"
	DATA=$QUERY_STRING
  ;;
  *)
    echo 'Status: 405 Method Not Allowed'
  ;;
esac
#echo "00000"
#echo $DATA
QUERY_STRING=$DATA
##echo $QUERY_STRING
url=$QUERY_STRING
echo $url
##wget --no-check-certificate $url
text=`curl $url` 

text=`echo "$text" |sed ':a;N;$!ba;s/\n/\\\\n/g'`



##echo "$text"
wtext="vHello world github/linguist#1 **cool**, and #1!"

json='{"text":"'"$text"'","mode":"gfm" }'
echo "$json"
curl -u "evagelosvar:marina12" --data "$json" https://api.github.com/markdown

exit





















#######
echo "Generating Site...<br><br>"
sortPosts(){
IFS='
'
for file in `find $path`
do
#echo $file
date=`getVarValue $file "date"`
if [ "$date" = "" ]
then
continue
else
#title=`getVarValue $file "title"`
#echo "$date""###""$file"
echo "$date""###""$file"
#echo "<br>"
fi
done | sort -r -b -k 1.9,1.10 -k 1.4,1.5 -k 1.1,1.2| sed 's/.*###//' > "$path""/sortedposts.hmtl" 
#cat "$path""/sortedposts.hmtl"
		
}
getTagsComma(){
	
file=$1
#echo $file
text=`cat $file`	
yamltext=`echo "$text"|sed -n '/---$/,/---$/p'`
#echo "<br>"
#echo "<br>"
#echo $yamltext

#var_value=`echo "$yamltext"|sed -r 's/tags:([^\]]*)/44\133/g'`


var_tags=`echo "$yamltext"|sed -n -r 's/tags: \[(.*)\]/\1/gp'`

#sed -n '/P1/,/P2/p; /P2/q'

echo $var_tags
}
getFirstImage()
{
	text=$1
	#echo $text
	img=`echo "$text"| sed -n -r 's/!\[\]\(([^)]*)\)/\1/p'`
	#echo "000000000000000000000000000000"
	#img=`echo "$text"| sed -n -r 's@\[@444@p'`
		echo '<img src="'
		echo "$img" 
		echo '" height="64" width="64">'
		echo '<br>'
}

getVarValue(){
file=$1
var_name=$2

text=`cat $file`	
yamltext=`echo "$text"|sed -n '/---$/,/---$/p'`
#echo $yamltext
 

#var_value=`echo "$yamltext"|sed -n -r 's/tags: \[(.*)\]/\1/gp'`
var_value=`echo "$yamltext"|sed -n -r 's/'$var_name': (.*)$/\1/gp'`
 
echo $var_value
}
testrename(){
	
#cd hugo/admin/test
#cd hugo/admin/articles/oldposts/x
#rename 's/^cob(...)$/cob\1\.md/' *	
#ls
echo '<br>'
#ls -l -R 
#hugo/admin/articles/oldposts/x
#for file in `find $path - type f -print0 | sort -z |xargs -r0 echo ""`
#do
#echo $file
#echo "<br>"

#done


#find $path -printf "%f###%p\n" | sort -n | sed 's/.*###//'

#find $path -printf "ls %p###%p\n"
#getVarValue %p 'date'
#ls
IFS='
'
for file in `find $path`
do
#echo $file
date=`getVarValue $file "date"`
if [ "$date" = "" ]
then
continue
else
#title=`getVarValue $file "title"`
#echo "$date""###""$file"
echo "$date""###""$file"
#echo "<br>"
fi
done | sort -r -b -k 1.9,1.10 -k 1.4,1.5 -k 1.1,1.2 > "$path""/sortedposts.hmtl"
cat "$path""/sortedposts.hmtl"
}

testfunc(){
	
#cat $path"/sidebar.html"
t="49  6 Wri  07/30/12  20:01\n\
988 5 Wri  09/23/11  06:45\n\
49  3 Wri  07/25/12  20:01\n\
0   2 Que  12/08/12  16:51\n\
988 7 Wri  02/09/11  06:45\n\
988 8 Wri  08/09/12  06:45\n\
988 1 Act  10/29/12  03:51"

echo $t
echo "<br>"
echo $t | sort -b -k 4.7,4.8 -k 4.1,4.2 -k 4.4,4.5
t="23/08/2017 ggg\n\
12/07/2017 tgtgt\n\
04/09/2015 gtgt\n\
12/07/2017 ggtt\n\
04/09/2015 ttt5t5"
echo $t
echo "<br>"
echo $t | sort -b -k 1.9,1.10 -k 1.4,1.5 -k 1.1,1.2
}
createTagPages(){
:
file="$1"
tags=`getTagsComma $file`
IFS=','

for tag in $tags
do
 
	#echo "<br>"
	#echo $tag
#echo "$text" | head -11  >> $path"/tagas/"$tag."md"
getSummary "$text" >> $path"/tagas/"$tag."md"
echo "<br>" >> $path"/tagas/"$tag."md"
echo "<hr>">> $path"/tagas/"$tag."md"
done

if [ "$tags" = "" ]
then

	#echo "<br>"
	#echo "none"
echo "$text" | head -11  >> $path"/tagas/""none.md"
echo "<br>" >> $path"/tagas/""none.md"
echo "<hr>">> $path"/tagas/""none.md"

fi






IFS='
'
}
#testfunc
sortPosts
#
#createTagLinks
#echo "xxdddddddddddddd77"
#exit


#find /home/ain/pCloudDrive/html/hugo/admin/includes

#ls -t

#echo "<br>"
#ls -tr
#echo "<br>"
#ls $path -tR

#echo "<br>"
#ls -t $path
#find $path
#ls -t `find $path`
xgetYamlVarValue_old(){
file=$1
#echo $file
text=`cat $file`
var_name="sitename"

#echo "$text"|sed -e '/---/,/---/p'
echo "lll"
var_value=`echo "$text"|sed -e '/---/,${s/'$var_name':/'$var_name':/p;d}' | sed -r  's/'$var_name': (.*)/\1/g'`
echo $var_value
}













#getYamlVarValue $path"/test.md"
#getYamlVarValue $path"/cheG.md"


#exit



getSummary(){
text="$1"
echo "$text" | sed ':a;N;$!ba;s/\n/abcd/g'| cut -d " " -f -40 | sed 's/abcd/\n/g' 	

}

createSummaryIndex(){
:
file="$1"
indexfile= "$2"	

title=`getVarValue $file "title"`
onlyfilename=`echo "$file" | sed 's!'^$path"/"'!!g'`
text=`cat "$file" | sed -e '/---/,/---/d'`


img=`getFirstImage "$text"`
#echo "$img"

titlelink='<a class="readmorelink" href="'"$onlyfilename"'">'"$title"'</a>'
echo "<h1>""$titlelink""</h1>">> $path"/"$indexfile

#echo "$text" | sed ':a;N;$!ba;s/\n/abcd/g'| cut -d " " -f -40 | sed 's/abcd/\n/g' >> $path"/"$indexfile
getSummary "$text" >> $path"/"$indexfile

#echo "$text" | head -11  >> $path"/"$indexfile
echo "<br>">> $path"/"$indexfile
}








createFooterPost(){
	
	
file="$1"
indexfile= "$2"	

date=`getVarValue $file "date"`
tags=`getTagsComma $file`
onlyfilename=`echo "$file" | sed 's!'^$path"/"'!!g'`

echo "<div class='readmore'>">> $path"/"$indexfile
echo "Posted: $date" >> $path"/"$indexfile
#onlyfilename=`basename $file`

linktofile='<a class="readmorelink" href="'"$onlyfilename"'">read-more</a>'
linktoedit='<a class="editlink" target="_blank" href="'"/hugo/admin/scripts/edit.sh?file=""$onlyfilename""&cmd=open"'">edit</a>'

#<a target="_blank" href="'"../scripts/edit.sh?file=""$onlyfilename""&cmd=open"'">edit</a>'
echo "$linktofile""---""$linktoedit" >> $path"/"$indexfile
echo "tags: $tags" >> $path"/"$indexfile
echo "<hr>">> $path"/"$indexfile
echo "<br><br><br>">> $path"/"$indexfile
echo "</div>">> $path"/"$indexfile
}
createTagLinks(){

echo "" > $path"/tags.html"
for file in `find $path"/tagas"`
do
:

if [ -d $file ]
then
:
continue
fi
	#echo "<hr>"
	#echo $file
tagonlyfilename=`basename $file`
tagname=`echo "$tagonlyfilename"|cut -d'.' -f1`
taglinks='<a href="'"/hugo/admin/articles/tagas/$tagonlyfilename"'">'"$tagname"'</a>'
echo "$taglinks"  >> $path"/tags.html"
#echo "$taglinks""<br>"

done

}

createSidebarLinks(){

file="$1"
recentpost="$2"
title=`getVarValue $file "title"`
onlyfilename=`echo "$file" | sed 's!'^$path"/"'!!g'`
text=`cat "$file" | sed -e '/---/,/---/d'`

img=`getFirstImage "$text"`

if [ "$title" = "" ]
then
#echo "=========="
#echo "$title"
#echo "=========="
linkname=`basename $file`
else
#echo "----------"
#echo "$title"
#echo "----------"
linkname=$title

fi
#linkname=`basename $file`

if [ $recentpost -lt 10 ]
then

echo "$img" >> $path"/sidebar.html"
fi
sidebarlink='<a href="'"/hugo/admin/articles/$onlyfilename"'">'"$linkname"'</a>'
echo "$xdate"" ""$sidebarlink""" >> $path"/sidebar.html"
echo "$linktoedit""<br>" >> $path"/sidebar.html"
echo "<hr class='hrsidebar'>" >> $path"/sidebar.html"




}


escapeFiles(){
file=""$1
ext=`echo "$file"|cut -d'.' -f2`
case $ext in
css|jpg|png|html|sh|tmp) echo ""
continue
;;
*) echo ""
;;
esac
#################################
case $file in
$path"/index"*".md") echo ""
continue
;;
*) echo ""
;;
esac	
	
}


initArticles(){
	
	#previndexfile=$indexfile
echo "" > $path"/"$indexfile
echo "" > $path"/sidebar.html"
echo "" > $path"/tagas/""none.md"
#echo '{{.Include "/hugo/admin/articles/header.html"}}' > /home/ain/pCloudDrive/html/hugo/admin/articles/index.md
 
rm  $path"/tagas/"*.*
}



listArticles(){
	
#find $path -type f -print0 | sort -z 
	
#exit	
	
	
countindex=""	
indexfile="index"$countindex".md"

echo "initArticles<br>"
initArticles
echo "============<br>"


for file in `cat "$path""/sortedposts.hmtl"`
#for file in `find $path`
#for file in `ls $path -tR`
do

#===========================
#check if file is folder and escape if it is
#===========================
if [ -d $file ]
then
:
continue
fi


#################################
#===========================
#check if file has not wanted extension
#===========================
echo "escapeFiles<br>"
escapeFiles "$file"
echo "============<br>"

#===========================
#split posts to pages (index.md, index1.md etc)
#===========================
count=$((count + 1))
recentpost=$((recentpost + 1))
#indexfile="index"$countindex".md"
if [ $count -gt 10 ]
then

countindex=$((countindex + 1))
#echo "link to page"$countindex >> $path"/"$indexfile
echo "<a href='""index"$countindex".md""'>next</a>">> $path"/"$indexfile
count=0
#previndexfile=$indexfile
indexfile="index"$countindex".md"
echo "" > $path"/"$indexfile
fi
#echo $indexfile
#echo $count








#################################


#################################
#echo "<br>"
#echo $file
#tags=`getTagsComma $file`
	#date=`getVarValue $file "date"`
	#title=`getVarValue $file "title"`
	#onlyfilename=`echo "$file" | sed 's!'^$path"/"'!!g'`
#===========================
#create summary index files
#===========================
echo "createSummaryIndex<br>"
createSummaryIndex "$file" "$indexfile"
echo "============<br>"



#===========================
#create summary tag files
#===========================

echo "createTagPages<br>"
createTagPages "$file" 
echo "============<br>"
#===========================
#create links read_more edit and tags
#===========================

echo "createFooterPost<br>"
createFooterPost "$file" "$indexfile"
echo "============<br>"
#===========================
#create sidebar post links
#===========================
echo "createSidebarLinks<br>"
createSidebarLinks "$file" "$recentpost"
echo "============<br>"
echo "<br>"
done
#===========================
#create sidebar tag links
#===========================
echo "createTagLinks<br>"
createTagLinks
echo "============<br>"

}



listArticles
exit
































