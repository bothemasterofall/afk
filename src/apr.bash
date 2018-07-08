#!/bin/bash
# Add PR to merge request

source afk_common.bash

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

add_unique_field_to_summary $mreq PR $pr

exit $?
