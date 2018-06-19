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
