#!/bin/bash
# Add merge request

function print_usage
{
    echo "usage: $0 repo mr desc"
}

target_repo=$1
if [ -z "$target_repo" ]
then
    print_usage
    exit 1
fi

new_mr=$2
if [ -z "$new_mr" ]
then
    print_usage
    exit 1
fi

desc=$3
if [ -z "$desc" ]
then
    print_usage
    exit 1
fi

if [ ! -d "$target_repo" ]
then
    echo "ERROR: $target_repo DNE"
    exit 1
fi

if [ -d "$target_repo/$new_mr" ]
then
    echo "ERROR: $target_repo/$new_mr already exists"
    exit 1
fi

mkdir $target_repo/$new_mr
if [ "$?" != "0" ]
then
    echo "ERROR: Creating $target_repo/$new_mr"
    exit 1
fi

chmod 775 $target_repo/$new_mr
if [ "$?" != "0" ]
then
    echo "WARN: Could not set group RW on $target_repo/$new_mr"
fi

echo "DESC: $desc" > $target_repo/$new_mr/SUMMARY
chmod 664 $target_repo/$new_mr/SUMMARY

exit 0
