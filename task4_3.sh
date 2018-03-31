#!/bin/bash

back_dir="/tmp/backups"

test -d "${back_dir}" || mkdir "${back_dir}"

if [[ $# -ne 2 ]]
then
    echoerr "ERROR: Invalid number of arguments" 1>&2
    exit 0
elif ! [[0 -lt $2]]
 then echo "Error: invalid argument $2" > &2
   exit 0 
    then
elif [[ -d $1 ]]
        then
            path='$1'
            name="`echo ${path} | sed -e 's/^[\/]*//;s/[\/]*$//;y/\//-/'`"
            count=$2
            count_backup=`ls "${back_dir}" | grep "${name}" | wc -l`
 else 
        echo "ERROR: Directory does not exist" 1>&2
        exit 0
fi
    
old_file=$(ls -1 ${2}-[1-9]*.tar.gz 2>/dev/null | sort -V | head -n -${2})

tar -zcvf "$name" "$back_dir" || {

   echo 'Error' >&2
   
}
rm -f $old_file


