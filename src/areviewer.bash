#!/bin/bash
# Add reviewer to merge request

function print_usage
{
    echo "usage: $0 repo/branch reviewer"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

reviewer=$2
if [ -z "$reviewer" ]
then
    print_usage
    exit 1
fi

summary=$mreq/SUMMARY
if [ ! -e $summary ]
then
    echo "ERROR: $mreq invalid"
    exit 1
fi

grep $reviewer $summary
if [ "$?" == "0" ]
then
    echo "$reviewer is already an reviewer"
    exit 1
fi

echo REVIEWER: $reviewer >> $summary
exit 0
