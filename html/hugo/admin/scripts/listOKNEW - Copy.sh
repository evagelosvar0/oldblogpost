#!/bin/sh
echo "Content-type: text/html"
echo ''

path=/home/ain/pCloudDrive/html/hugo/admin/articles
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
getYamlVarValue_old(){
file=$1
#echo $file
text=`cat $file`
var_name="sitename"

#echo "$text"|sed -e '/---/,/---/p'
echo "lll"
var_value=`echo "$text"|sed -e '/---/,${s/'$var_name':/'$var_name':/p;d}' | sed -r  's/'$var_name': (.*)/\1/g'`
echo $var_value
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







#getYamlVarValue $path"/test.md"
#getYamlVarValue $path"/cheG.md"


#exit
listArticles(){
countindex=""	
indexfile="index"$countindex".md"
#previndexfile=$indexfile
echo "" > $path"/"$indexfile
echo "" > $path"/sidebar.html"
#echo '{{.Include "/hugo/admin/articles/header.html"}}' > /home/ain/pCloudDrive/html/hugo/admin/articles/index.md
 
rm  $path"/tagas/"*.*


for file in `find $path`
#for file in `ls $path -tR`
do

#===========================
#check if file is folder
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
#################################




#===========================
#split posts to pages (index.md, index1.md etc)
#===========================
count=$((count + 1))
#indexfile="index"$countindex".md"
if [ $count -gt 30 ]
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
echo "<br>"
echo $file



#===========================
#create summary index files
#===========================
text=`cat "$file" | sed -e '/---/,/---/d'`
echo "$text" | head -11  >> $path"/"$indexfile
echo "<br>">> $path"/"$indexfile

#===========================
#create summary tag files
#===========================
 
date=`getVarValue $file "date"`
#echo "======"
#echo "$date"
#echo "======"
tags=`getTagsComma $file`

IFS=','

for tag in $tags
do
 
echo "<br>"
echo $tag
echo "$text" | head -11  >> $path"/tagas/"$tag."md"
echo "<br>" >> $path"/tagas/"$tag."md"

done

IFS='
'

#===========================
#create links read_more edit and tags
#===========================
echo "Posted: $date" >> $path"/"$indexfile
onlyfilename=`basename $file`
linktofile='<a href="'"$onlyfilename"'">Read more</a><a target="_blank" href="'"/hugo/admin/scripts/edit.sh?file=""$onlyfilename""&cmd=open"'">Edit</a>'
echo "$linktofile" >> $path"/"$indexfile
echo "$tags" >> $path"/"$indexfile
echo "<hr>">> $path"/"$indexfile
echo "<br><br><br>">> $path"/"$indexfile




#===========================
#create sidebar post links
#===========================
sidebarlinks='<a href="'"/hugo/admin/articles/$onlyfilename"'">'"$onlyfilename"'</a>'
echo "$sidebarlinks""<br>" >> $path"/sidebar.html"

done


#===========================
#create sidebar tag links
#===========================
echo "" > $path"/tags.html"
for file in `find $path"/tagas"`
do
:

if [ -d $file ]
then
:
continue
fi
echo "<hr>"
echo $file
tagonlyfilename=`basename $file`
taglinks='<a href="'"/hugo/admin/articles/tagas/$tagonlyfilename"'">'"$tagonlyfilename"'</a>'
echo "$taglinks"  >> $path"/tags.html"
#echo "$taglinks""<br>"



done





}



listArticles
exit
































