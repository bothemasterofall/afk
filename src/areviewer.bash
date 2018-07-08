#!/bin/bash
# Add reviewer to merge request

source afk_common.bash

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
    reviewer=`whoami`
fi

add_unique_field_to_summary $mreq REVIEWER $reviewer

exit $?
