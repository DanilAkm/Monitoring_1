#!/usr/bin/env bash

if test "$#" -ne 1 ; then
    echo "Illegal number of parameters"
else
    re='^-?([0-9]*[.])?[0-9]+$'
    if [[ $1 =~ $re ]]; then
        echo "invalid input"
    else
        echo $1
    fi
fi
