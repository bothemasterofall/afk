#!/bin/bash
# Add dependency to merge request

source afk_common.bash

function print_usage
{
    echo "usage: $0 repo/branch dep"
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

add_unique_field_to_summary $mreq DEP $dep

exit $?
