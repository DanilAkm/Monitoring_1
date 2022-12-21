#!/usr/bin/env bash

source ./check.sh
input

sudo chmod +x *.sh

./systeminfo.sh "$font1" "$back1" "$font2" "$back2"
./networkinfo.sh "$font1" "$back1" "$font2" "$back2"
./memoryinfo.sh "$font1" "$back1" "$font2" "$back2"
