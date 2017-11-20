#!/bin/sh
#echo "Content-type: text/html"
#echo ''
path=/home/ain/pCloudDrive/uploads/mysites/gymnasioker4
 decode(){
	
	hexstring=$1
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}





runJQUERY(){
cat << EOF
<script src=/www/master-scripts/jquery213.js></script>

<script type="text/javascript" src="http://school.graeca.tk/pCloudDrive/uploads/mysites/gymnasioker4/000.common/marked.js"></script>






<script>

\$(document).ready(function() {
	
//alert("22");
var oldVal = "";
\$("#mytextarea").on("change keyup paste", function() {
    var currentVal = \$(this).val();
    if(currentVal == oldVal) {
        return; //check to prevent multiple simultaneous triggers
    }

    oldVal = currentVal;
    //action to be performed on textarea changed
  //  alert("changed!");
			  
			  marked.defaults = {
			  gfm: true,
			  tables: true,
			  breaks: true,
			  pedantic: false,
			  sanitize: false,
			  smartLists: false,
			  silent: false,
			  highlight: null,
			  langPrefix: 'lang-'
			};
    

			\$("#render").html(function () {
			//return "<b>"+oldVal+"</b>"
			return (marked(oldVal))
			});
			
      //  document.getElementById('render').innerHTML = (marked('this is __markdown__'));
      // document.getElementById('render').innerHTML = (marked(oldVal));

    
    
    
    
    
    
});



});
</script>

EOF
	
}



listPath(){
	
IFS='
'
echo "<select id='selectinput' name="folder">"


for folder in `ls -t $path`
do
if [ -f $path"/"$folder ]
		then
		
		:
		continue
		#echo "" >"$path""/""$folder""/""list.txt"	
		else
:

fi



#file=`echo $folder |sed 's/\/home\/ain\///g'`

echo "<option  value='""$folder""'>""$folder</option>"
done
echo "</select>"

}






showEditor(){

text=$1


cat << EOF

<form id='save'  action="http://school.graeca.tk/www/master-scripts/gatehex.sh" method="get" enctype="application/x-www-form-urlencoded" target="SHOW">
<input    type="hidden" name="script" value="../../pCloudDrive/uploads/master-scripts/admin2.sh" id="textinput" placeholder="Search in atonic Greek..." >

<input type="radio" name="cmd" value="save" checked> Save<br>
<input type="radio" name="cmd" value="edit"> Edit<br>
`listPath`
<button id="save">Go!</button>
<br>
<textarea id=mytextarea type="text" name="markupText" rows="30" cols="50" style="float:left">
$text
</textarea>

<div id=render style="float:left;height: 455px;width:400px;background-color:#F5F5DC;">

</div>

<br>

 

</form>

EOF







	
}















cmd=$1
folder=$2
markText=$3
markText=`decode  $markText`
markText=`echo "$markText" | sed 's!+! !g'`
#markText=`echo "$markText" | sed 's!\s$!!g'`

case $cmd in
save)
runJQUERY
showEditor
echo "<br>"
#echo $markText > $path"/"$folder"/""index.html"

echo $markText > $path"/"$folder"/""index.txt"
;;

edit)
#text=`cat $path"/"$folder"/""index.html"`
text=`cat $path"/"$folder"/""index.txt"`


runJQUERY
showEditor "$text"
echo "<br>"
;;

*)
runJQUERY
showEditor 
;;

esac

#echo $cmd
echo "<br>"
#echo $markText
echo "<br>"
#echo $folder


