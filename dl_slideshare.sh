#!/bin/bash

if [ -z $1 ]
then
        echo "Usage: ./dl-slideshare.sh URL"
        echo "Example: ./dl-slideshare.sh http://www.slideshare.net/bbaskin/malware-intelligence"
        exit 1
fi

savepath="/tmp/slideshare"

if [ ! -d "$savepath" ]
then
        mkdir $savepath
fi
path=`pwd`

name=`echo $1 | grep -Eoi '/[a-zA-Z0-9-]+$' | cut -d/ -f 2`

#listurl=`curl $1 | grep http://image.slidesharecdn.com/.*1024.jpg | awk -F= '{ print $6$7 }' | cut -d' ' -f 1`

##### Create image url
listurl=`curl $1 | grep -Eoi 'data-full.*http://image.slidesharecdn.com/.*1024.jpg\?cb=[0-9]+' | cut -d\" -f 2`

cd $savepath

##### Loop Download List Picture
for i in $listurl
do
        `wget $i`
done

#### Convert all picture to pdf
convert `ls -v` $path/$name.pdf
rm $savepath/* 


