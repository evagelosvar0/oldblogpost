#!/bin/sh
echo "Content-type: text/html"
echo ''
path=/home/ain/pCloudDrive/html/hugo/admin/articles

t="%CE%B1%CE%B1%CE%B1dsdsdsdssds%3Ddsdsdsdsds "
decode(){
str=$1
echo "$str" | sed 's@+@ @g;s@%@\\x@g' | xargs -0 printf "%b"
}
decode $t

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






runJQUERY(){
cat << EOF
<script src=../js/jquery213.js></script>

<link rel="stylesheet" href="http://lab.lepture.com/editor/editor.css" />
<script type="text/javascript" src="http://lab.lepture.com/editor/editor.js"></script>
<script type="text/javascript" src="http://lab.lepture.com/editor/marked.js"></script>
<script src=../js/edit.js></script>


<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

EOF
	
}
urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }


decode2(){
	
	hexstring=$1
	#hexstring=`echo "$hexstring" | tr '+' ' '`
	hexstring=`echo "$hexstring" | sed 's/+/99999/g'`
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}
decode22(){
	
	hexstring=$1
	#hexstring=`echo "$hexstring" | tr '+' ' '`
	hexstring=`echo "$hexstring" | sed 's/+/99999/g'`
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}
listPosts(){
	post=$1
	#echo $post
	#echo "<br>"
#ls -t $path
	
IFS='
'
echo "<select id='myselect' name="file">"
echo "<option selected value="$post">"$post"</option>"
echo "</select>"

}






showEditor(){
	
textareacontent=$1
post=$2
cat << EOF




<form id='myform' id="myform" action="edit2.sh" method="post">


			`listPosts $post`



<input type="submit" id="save" name="cmd" value="save">
<input type="submit" id="open" name="cmd" value="open">

<textarea id=mytextarea type="text" name="markupText" rows="4" cols="50">$textareacontent</textarea>
<br>


</form>

<div id=render style="background-color:#F5F5DC;z-index: -111";>


All your awesome markdown content goes here.

## Chapter 1

Lorem ipsum 
 
</div>
 




EOF
	
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


QUERY_STRING=`decode $QUERY_STRING`
echo $QUERY_STRING
#QUERY_STRING=`urldecode "$QUERY_STRING"`



###QUERY_STRING=`echo "$QUERY_STRING" | sed 's/99999/ /g'`

#echo $QUERY_STRING
#echo "====<br>"
#decode $QUERY_STRING
#echo "-----<br>"
#decode $t



#echo '<br>'
IFS="&"
count=0
for pair in $QUERY_STRING
do
count=`expr $count + 1`
if [ $count -eq "1" ];then
#echo '<br>'

file=`echo "$pair"|cut -d'=' -f2`	
echo '<br>'
#echo $file
#echo '======='
 echo '<br>'
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
x=`cat $path"/"$file`
showEditor "$x" "$path"/"$file"
;;

save)
#echo "<br>"
#echo $file
#echo "===="


showEditor "Your Post has been Saved...Go to the blog to edit another"  

decode $markText > $file
ls hugo/admin
ls hugo/admin
decode  $markText
		#sh hugo/admin/scripts/list.sh > $path"/"tmp.tmp
#echo $?
#echo $file".html"
exit
;;
create)
#echo "$path""/""$file"".md"
echo "" > "$path""/""$file"".md"
x="You Created new Post"
showEditor "$x" "$path""/""$file"".md"
;;
*)#x=`cat $path"/"$file`
:
#showEditor "$x" "$path"/"$file"
;;
esac



