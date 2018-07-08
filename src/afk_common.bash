#!/bin/bash

# Finds all numbered files, echos greatest
function greatest_num_file
{
    local mops_max=0

    for i in `ls | grep "^[0-9]\+$"`
    do
        if [ $i -gt $mops_max ]
        then
            mops_max=$i
        fi
    done

    echo $mops_max
}

# $1 = path/to/mreq/
# $2 = field
# $3 = entry
function add_unique_field_to_summary
{
    if [ -z "$1" ]
    then
        return 1
    fi

    local summary=$1/SUMMARY
    if [ ! -e $summary ]
    then
        echo "ERROR: $0: $mreq invalid"
        return 1
    fi
    
    local field=$2
    if [ -z "$field" ]
    then
        return 1
    fi

    local entry=$3
    if [ -z "$entry" ]
    then
        return 1
    fi

    grep "$entry" "$summary"
    if [ "$?" == "0" ]
    then
        echo "ERROR: $0: $entry is already a $field"
        return 1
    fi
    
    echo $field: $entry >> $summary
    return 0
}
