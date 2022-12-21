#!/usr/bin/env bash

if [[ $# == 4 ]]
then
    sudo chmod +x *.sh

    source ./check.sh
    input "$1" "$2" "$3" "$4"

    ./systeminfo.sh "$font1" "$back1" "$font2" "$back2"
    ./networkinfo.sh "$font1" "$back1" "$font2" "$back2"
    ./memoryinfo.sh "$font1" "$back1" "$font2" "$back2"

else
    echo "4 parameters required"
    exit
fi
