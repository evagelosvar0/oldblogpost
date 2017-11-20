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



getYamlVarValue(){
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
listArticles(){
echo "" > $path"/index.md"
echo "" > $path"/sidebar.html"
#echo '{{.Include "/hugo/admin/articles/header.html"}}' > /home/ain/pCloudDrive/html/hugo/admin/articles/index.md
for file in `find $path`
#for file in `ls $path -tR`
do


#################################
ext=`echo "$file"|cut -d'.' -f2`
case $ext in
css|jpg|png|html|sh) echo ""
continue
;;
*) echo ""
;;
esac
#################################
case $file in
$path"/index.md") echo ""
continue
;;
*) echo ""
;;
esac



#################################
if [ -d $file ]
then
:
continue
else
:

#################################
echo $file

#cat "$file" >> /home/ain/pCloudDrive/html/hugo/admin/articles/index.md
#cat "$file" | head -10 >> /home/ain/pCloudDrive/html/hugo/admin/articles/index.md


text=`cat "$file" | sed -e '/---/,/---/d'`
#echo $text

#head -11 "$file" >> /home/ain/pCloudDrive/html/hugo/admin/articles/index.md
echo "$text" | head -11  >> $path"/index.md"


echo "<br>">> $path"/index.md"

#################################
onlyfilename=`basename $file`
linktofile='<a href="'"$onlyfilename"'">Read more</a><a target="_blank" href="'"../scripts/edit.sh?file=""$onlyfilename""&cmd=open"'">Edit</a>'



echo "$linktofile" >> $path"/index.md"
echo "<hr>">> $path"/index.md"
echo "<br><br><br>">> $path"/index.md"
#################################
sidebarlinks='<a href="'"$onlyfilename"'">'"$onlyfilename"'</a>'
echo "$sidebarlinks""<br>" >> $path"/sidebar.html"



#getYamlVarValue $file >> /home/ain/pCloudDrive/html/hugo/admin/articles/sidebar.html


#################################

fi
#################################







 
 
done

}



listArticles
exit




rawurldecode() {

  # This is perhaps a risky gambit, but since all escape characters must be
  # encoded, we can replace %NN with \xNN and pass the lot to printf -b, which
  # will decode hex for us

  printf -v REPLY '%b' "${1//%/\\x}" # You can either set a return variable (FASTER)

  echo "${REPLY}"  #+or echo the result (EASIER)... or both... :p
}

#rawurldecode "fgfgfgg"

#exit








decode(){
	
	hexstring=$1
	#hexstring=`echo "$hexstring" | tr '+' ' '`
	hexstring=`echo "$hexstring" | sed 's/+/99999/g'`
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}



















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
#echo $QUERY_STRING
QUERY_STRING=`decode $QUERY_STRING`
QUERY_STRING=`echo "$QUERY_STRING" | sed 's/99999/ /g'`

#echo $QUERY_STRING

#echo '<br>'
IFS="&"
count=0
for pair in $QUERY_STRING
do
count=`expr $count + 1`
if [ $count -eq "1" ];then
#echo '<br>'

file=`echo "$pair"|cut -d'=' -f2`	
 
		#echo $file
 
fi

if [ $count -eq "2" ];then
#echo '<br>'

cmd=`echo "$pair"|cut -d'=' -f2`	
 
		#echo $cmd
 
fi
if [ $count -eq "3" ];then
#echo '<br>'

markText=`echo "$pair"|cut -d'=' -f2`	
 
		#echo $markText
 
fi







done






#action=`echo "$QUERY_STRING" | sed -r 's/^(([^=]*)=([^=]*)\&)(.*)/\3/g'`

#file=`echo "$QUERY_STRING" | sed -r 's/^[^=]*=([^=]*)\&(.*)/\1/g'`

#file=`echo "$QUERY_STRING" | sed -r 's|file=([^=]*)\&cmd=.*$|\1|g'`3##echo "------"
#echo '<br>'

#sed ':a;N;$!ba;s/\n/ /g'
#filex=`echo "$QUERY_STRING" | sed -r 's/(file=[^=]*)\&cmd=.*$/\1/g'`
#x="555\n000\n66666666666"

#filex=`echo "$x" | sed -e '/000/,$!d'`

 
#cmd=`echo "$QUERY_STRING" | sed -r 's/^[^=]*=[^=]*\&[^=]*=([^=]*)\&(.*)/\1/g'`

#marktext=`echo "$QUERY_STRING" | sed -r 's/^[^=]*=[^=]*\&[^=]*=[^=]*\&[^=]*=([^=]*)/\1/g'`

#action=`echo "$QUERY_STRING" | sed -r 's/^([^=]*)=([^=]*)\&([^=]*)=([^=]*)\&(.*)/\4/g'`

 

runJQUERY

#echo "<br>"

  
#showEditor " rrrrr"


case $cmd in

open)
#echo "eeeeeeeeeeeeeeeeeeeeex"
x=`cat $file`
#echo "$x"
 
showEditor "$x" "$file"
;;

save)
#echo "<br>"
showEditor "Your Post has beem Saved"
echo $markText > $file
echo $?
echo $file".html"
;;
create)
#echo "$path""/""$file"".md"
echo "" > "$path""/""$file"".md"
x="You Created new Post"
showEditor "$x" "$path""/""$file"".md"
;;
*)showEditor ""
;;
esac



