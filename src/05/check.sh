#!/usr/bin/env bash

input () {
    if [[ "${1: -1}" == "/" ]];
    then
        foor=1
    else
        echo "the parameter must and with /"
        exit
    fi

    if [[ ! -d "$1" ]];
    then
        echo "the folder does not exist"
        exit
    fi
}
