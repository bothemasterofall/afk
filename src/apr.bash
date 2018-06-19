#!/bin/bash
# Add PR to merge request

function print_usage
{
    echo "usage: $0 repo/branch pr"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

pr=$2
if [ -z "$pr" ]
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

grep $pr $summary
if [ "$?" == "0" ]
then
    echo "$pr is already linked"
    exit 1
fi

echo PR: $pr >> $summary
exit 0
