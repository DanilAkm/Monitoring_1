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

defback1="$GREEN_BACK"
deffont1="$RED"
defback2="$RED_BACK"
deffont2="$GREEN"

input () {
    fileback1=$(grep "column1_background" colors.config | cut -d "=" -f 2)
    filefont1=$(grep "column1_font_color" colors.config | cut -d "=" -f 2)
    fileback2=$(grep "column2_background" colors.config | cut -d "=" -f 2)
    filefont2=$(grep "column2_font_color" colors.config | cut -d "=" -f 2)

    set -- "$fileback1" "$filefont1" "$fileback2" "$filefont2"

    if ! [ ${1//[1-6]/} ] && [ "$1" -ge 1 ] && [ "$1" -le 6 ]; then
        case $1 in
            1)
                back1=$WHITE_BACK
                echo "Column 1 background = 1 (white)"
                set -- "1" "$2" "$3" "$4";;
            2)
                back1=$RED_BACK
                echo "Column 1 background = 2 (red)"
                set -- "2" "$2" "$3" "$4";;
            3)
                back1=$GREEN_BACK
                echo "Column 1 background = 3 (green)"
                set -- "3" "$2" "$3" "$4";;
            4)
                back1=$BLUE_BACK
                echo "Column 1 background = 4 (blue)"
                set -- "4" "$2" "$3" "$4";;
            5)
                back1=$PURPLE_BACK
                echo "Column 1 background = 5 (purple)"
                set -- "5" "$2" "$3" "$4";;
            6)
                back1=$BLACK_BACK
                echo "Column 1 background = 6 (black)"
                set -- "6" "$2" "$3" "$4";;
        esac
    else
        back1=$defback1
        echo "Column 1 background = default (green)"
        set -- "3" "$2" "$3" "$4"
    fi
    if ! [ ${2//[1-6]/} ] && [ "$2" -ge 1 ]  && [ "$2" -le 6 ] ; then
        case $2 in
            1)
                font1=$WHITE
                echo "Column 1 font color = 1 (white)"
                set -- "$1" "1" "$3" "$4";;
            2)
                font1=$RED
                echo "Column 1 font color = 2 (red)"
                set -- "$1" "2" "$3" "$4";;
            3)
                font1=$GREEN
                echo "Column 1 font color = 3 (green)"
                set -- "$1" "3" "$3" "$4";;
            4)
                font1=$BLUE
                echo "Column 1 font color = 4 (blue)"
                set -- "$1" "4" "$3" "$4";;
            5)
                font1=$PURPLE
                echo "Column 1 font color = 5 (purple)"
                set -- "$1" "5" "$3" "$4";;
            6)
                font1=$BLACK
                echo "Column 1 font color = 6 (black)"
                set -- "$1" "6" "$3" "$4";;
        esac
    else
        font1=$deffont1
        echo "Column 1 font color = default (red)"
        set -- "$1" "2" "$3" "$4"
    fi
    if ! [ ${3//[1-6]/} ] && [ "$3" -ge 1 ] && [ "$3" -le 6 ]; then
        case $3 in
            1)
                back2=$WHITE_BACK
                echo "Column 2 background = 1 (white)"
                set -- "$1" "$2" "1" "$4";;
            2)
                back2=$RED_BACK
                echo "Column 2 background = 2 (red)"
                set -- "$1" "$2" "2" "$4";;
            3)
                back2=$GREEN_BACK
                echo "Column 2 background = 3 (green)"
                set -- "$1" "$2" "3" "$4";;
            4)
                back2=$BLUE_BACK
                echo "Column 2 background = 4 (blue)"
                set -- "$1" "$2" "4" "$4";;
            5)
                back2=$PURPLE_BACK
                echo "Column 2 background = 5 (purple)"
                set -- "$1" "$2" "5" "$4";;
            6)
                back2=$BLACK_BACK
                echo "Column 2 background = 6 (black)"
                set -- "$1" "$2" "6" "$4";;
        esac
    else
        back2=$defback2
        echo "Column 2 background = default (red)"
        set -- "$1" "$2" "2" "$4"
    fi
    if ! [ ${4//[1-6]/} ] && [ "$4" -ge 1 ] && [ "$4" -le 6 ]; then
        case $4 in
            1)
                font2=$WHITE
                echo "Column 2 font color = 1 (white)"
                set -- "$1" "$2" "$3" "1";;
            2)
                font2=$RED
                echo "Column 2 font color = 2 (red)"
                set -- "$1" "$2" "$3" "2";;
            3)
                font2=$GREEN
                echo "Column 2 font color = 3 (green)"
                set -- "$1" "$2" "$3" "3";;
            4)
                font2=$BLUE
                echo "Column 2 font color = 4 (blue)"
                set -- "$1" "$2" "$3" "4";;
            5)
                font2=$PURPLE
                echo "Column 2 font color = 5 (purple)"
                set -- "$1" "$2" "$3" "5";;
            6)
                font2=$BLACK
                echo "Column 2 font color = 6 (black)"
                set -- "$1" "$2" "$3" "6";;
        esac
    else
        font2=$deffont2
        echo "Column 2 font color = default (green)"
        set -- "$1" "$2" "$3" "3"
    fi

    if [[ "$1" == "$2" || "$3" == "$4" ]]
    then
        echo "invalid input: background can't be the same color as the text"
        exit
    fi

    if ! command -v ifconfig &> /dev/null
    then
        echo "install net-tools"
    fi
}
