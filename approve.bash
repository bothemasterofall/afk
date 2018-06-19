#!/bin/bash
# Mark a merge request as APPROVED

function print_usage
{
    echo "usage: $0 repo/mr"
}

# Finds all numbered files, echos greatest
function greatest_num_file
{
    local max=0
    for i in `ls | grep "^[0-9]\+$"`
    do
        if [ $i -gt $max ]
        then
            max=$i
        fi
    done

    echo $max
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi


cd $mreq
if [ -e APPROVED ]
then
    echo "WARN: $mreq already APPROVED"
    exit 0
fi

touch APPROVED
chmod 644 APPROVED

exit 0
