#!/usr/bin/env bash

start=`date +%s`

if [[ $# = 1 ]];
then
    source ./check.sh
    input "$1"
else
    echo "invalid number of parameters"
    exit
fi

source ./folders.sh
print_folders "$1"

end=`date +%s`
runtime=$((end-start))
echo "Script execution time (in seconds) = $runtime"
