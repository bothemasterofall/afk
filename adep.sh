#!/bin/bash
# Add dependency to merge request

function print_usage
{
    echo "usage: $0 repo/mr dep"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

dep=$2
if [ -z "$dep" ]
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

grep $dep $summary
if [ "$?" == "0" ]
then
    echo "$dep is already linked"
    exit 1
fi

echo DEP: $dep >> $summary
exit 0
