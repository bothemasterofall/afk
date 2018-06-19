#!/bin/bash
# Add new repo

function print_usage
{
    echo "$0 repo_name"
}

repo_name=$1
if [ -z "$repo_name" ]
then
    print_usage
    exit 1
fi

mkdir $repo_name
if [ "$?" != "0" ]
then
    echo "ERROR: Creating $repo_name"
    exit 1
fi

chmod 775 $repo_name

exit 0
