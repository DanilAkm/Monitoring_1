#!/usr/bin/env bash

WHITE='\033[0;37;'
RED='\033[0;31;'
GREEN='\033[0;32;'
BLUE='\033[0;34;'
PURPLE='\033[0;35;'
BLACK='\033[0;30;'

WHITE_BACK='47m'
RED_BACK='41m'
GREEN_BACK='42m'
BLUE_BACK='44m'
PURPLE_BACK='45m'
BLACK_BACK='40m'

NC='\033[0m' # No Color

input () {
    if ! [ ${1//[1-6]/} ] && [ "$1" -ge 1 ] && [ "$1" -le 6 ]; then
        case $1 in
            1)
                back1=$WHITE_BACK;;
            2)
                back1=$RED_BACK;;
            3)
                back1=$GREEN_BACK;;
            4)
                back1=$BLUE_BACK;;
            5)
                back1=$PURPLE_BACK;;
            6)
                back1=$BLACK_BACK;;
        esac
    else
        echo "invalid parameter (1-6)"
        exit
    fi
    if ! [ ${2//[1-6]/} ] && [ "$2" -ge 1 ] && [ "$2" -le 6 ]; then
        case $2 in
            1)
                font1=$WHITE;;
            2)
                font1=$RED;;
            3)
                font1=$GREEN;;
            4)
                font1=$BLUE;;
            5)
                font1=$PURPLE;;
            6)
                font1=$BLACK;;
        esac
    else
        echo "invalid parameter (1-6)"
        exit
    fi
    if ! [ ${3//[1-6]/} ] && [ "$3" -ge 1 ] && [ "$3" -le 6 ]; then
        case $3 in
            1)
                back2=$WHITE_BACK;;
            2)
                back2=$RED_BACK;;
            3)
                back2=$GREEN_BACK;;
            4)
                back2=$BLUE_BACK;;
            5)
                back2=$PURPLE_BACK;;
            6)
                back2=$BLACK_BACK;;
        esac
    else
        echo "invalid parameter (1-6)"
        exit
    fi
    if ! [ ${4//[1-6]/} ] && [ "$4" -ge 1 ] && [ "$4" -le 6 ]; then
        case $4 in
            1)
                font2=$WHITE;;
            2)
                font2=$RED;;
            3)
                font2=$GREEN;;
            4)
                font2=$BLUE;;
            5)
                font2=$PURPLE;;
            6)
                font2=$BLACK;;
        esac
    else
        echo "invalid parameter (1-6)"
        exit
    fi

    if [[ $1 == $2 || $3 == $4 ]]
    then
        echo "invalid input: background can't be the same color as the text"
        exit
    fi

    if ! command -v ifconfig &> /dev/null
    then
        echo "install net-tools"
    fi
}
