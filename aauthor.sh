#!/bin/bash
# Add author to merge request. Default is whoami.

function print_usage
{
    echo "usage: $0 repo/mr [author]"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

author=$2
if [ -z "$author" ]
then
    author=`whoami`
fi

summary=$mreq/SUMMARY
if [ ! -e $summary ]
then
    echo "ERROR: $mreq invalid"
    exit 1
fi

grep $author $summary
if [ "$?" == "0" ]
then
    echo "$author is already an author"
    exit 1
fi

echo AUTHOR: $author >> $summary
exit 0
