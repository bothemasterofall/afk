#!/bin/bash
# Add author to merge request. Default is whoami.

source afk_common.bash

function print_usage
{
    echo "usage: $0 repo/branch [author]"
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

add_unique_field_to_summary $mreq AUTHOR $author

exit $?
