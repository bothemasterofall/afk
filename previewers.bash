#!/bin/bash

function print_usage
{
    echo "usage: $0 repo/mr"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

if [ ! -d $mreq ]
then
    echo "ERROR: $mreq DNE"
    exit 1
fi

cat $mreq/SUMMARY | grep "REVIEWER" | grep -o "\<[a-z|A-Z|0-9|_|-]\+\>$"
exit 0
