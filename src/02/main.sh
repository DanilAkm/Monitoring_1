#!/usr/bin/env bash

if ! command -v ifconfig &> /dev/null
then
    echo "net-tools required"
    echo "sudo apt install net-tools"
    exit
fi

sudo chmod +x *.sh

./systeminfo.sh

sudo ./networkinfo.sh

sudo ./memoryinfo.sh

if [ "$1" != "no_save" ]
then
    echo "write to a file? Y/n"
fi
read response

if [[ $response == Y || $response == y ]]
then
    filename=$(date +"%d_%m_%Y_%H_%M_%S")
    sudo ./main.sh "no_save" <<< "no save" >> "$filename.status"
fi
