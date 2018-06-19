#!/bin/bash
# Print all comments made by a reviewer for a branch sorted by iteration.

source math_ops.sh

function print_usage
{
    echo "usage: $0 repo/mr reviewer it"
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

target_it=$3
if [ -z "$target_it" ]
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

comment_file="${target_it}/${reviewer}.csv"

if [ -e $comment_file ]
then
    cat $comment_file
fi

exit 0
