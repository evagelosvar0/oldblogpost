#!/bin/bash

echo "Content-type: text/html"
echo ""


echo "ok"

cd test
#text=`cat ./oldposts.md`

#x1='--- \ntitle: '
#x2='\ndate: 2011-03-20\ntags: ["example1", "example2"]\n---'

#x=0000
#text=`echo "$text" | sed -r 's/@@@/'"$x"'/g'`
#----------
#text=`echo "$text" | sed -r 's/#(.*$)/'"$x1"'\1'"$x2"'/g'`

#text=`echo "$text" | sed -r 's/----------//g'`


#cd /home/ain/pCloudDrive/html/hugo/gymnasioker4/content/post/oldposts



#echo "$text" > xxxfile.md



#ls 
#/html/hugo/gymnasioker4/content/post/
rm -rf x
mkdir x
#echo "scale=2 ; $var1 / $var2" | bc
#http://tuxthink.blogspot.gr/2012/07/csplit-split-file-based-on-patterns.html
csplit -f x/cob oldpostsOK.md '/@@@/' {*}
cd x
rename 's/(^cob.*$)/\1\.md/' *
#

#echo "$x"

for file in `ls`
do
echo $file
content=`cat $file`
newfile=`echo "$content"|sed 's/@@@//g'|sed 1d`
echo "$newfile" > $file
done
cd ..
cp -r x/ /home/ain/pCloudDrive/html/hugo/gymnasioker4/content/post/oldposts/ 
