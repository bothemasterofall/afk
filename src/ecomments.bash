#!/bin/bash
# Edit comments for latest iteration

source afk_common.bash

function print_usage
{
    echo "usage: $0 repo/branch"
}

mreq=$1
if [ -z "$mreq" ]
then
    print_usage
    exit 1
fi

if [ ! -d $mreq ]
then
    echo "ERROR: $mreq DNE"
    exit 1
fi


reviewer=`whoami`
previewers.bash $mreq | grep "$reviewer"
if [ "$?" != "0" ]
then
    echo "ERROR: $reviewer is not a reviewer for $mreq"
    exit 1
fi

cd $mreq

cur_it=`greatest_num_file`
if [ "$cur_it" == "0" ]
then
    echo "ERROR: No iterations in $mreq"
    cd ../../
    exit 1
fi

libreoffice ${cur_it}/${reviewer}.csv

cd ../../

exit 0
