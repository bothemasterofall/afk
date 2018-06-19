#!/bin/bash
# Add iteration to merge request

source afk_common.bash

function print_usage
{
    echo "usage: $0 repo/mr hash"
}

# Main

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

hash=$2
if [ -z "$hash" ]
then
    print_usage
    exit 1
fi

if [ ! -d $mreq ]
then
    echo "ERROR: $mreq DNE"
    exit 1
fi

cd $mreq

staging_area=0

rm -rf $staging_area
mkdir $staging_area
chmod 775 $staging_area

grep -rl $hash
if [ "$?" == "0" ]
then
    echo "ERROR: Iteration for $hash already exists"
    exit 1
fi

cur_it=`greatest_num_file`
newit=$((cur_it + 1))

echo $hash >> $staging_area/HASH
chmod 644 $staging_area/HASH

if [ -e APPROVED ]
then
    echo "WARN: Removing approval for $mreq"
    rm APPROVED
fi


cd ../../

for i in `./previewers.sh $mreq`
do
    comment_file=${mreq}/${staging_area}/${i}.csv
    if [ "$newit" == "0" ]
    then
        echo -e '\t\t\t\t\t\t' >> $comment_file
    else
        ./pcomments.sh $mreq $i $cur_it >> $comment_file
    fi

    chmod 664 $comment_file
done

cd $mreq

mv $staging_area $newit
if [ "$?" != "0" ]
then
    echo "ERROR: Could not create iteration $mreq/$newit"
    exit 1
fi


exit 0
