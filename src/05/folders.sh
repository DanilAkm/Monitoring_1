#!/usr/bin/env bash

print_folders () {
    foldersnum=$(sudo find "$1"* -maxdepth 100 -type d | grep -c "$1")
    echo "Total number of folders (including all nested ones) = $foldersnum"

    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    for i in 1 2 3 4 5
    do
        foldername=$(sudo du -sh -- "$1"*/ 2> /dev/null | sort -rh | sed -n ""$i"p" | cut -f2)
        foldersize=$(sudo du -sh -- "$1"*/ 2> /dev/null | sort -rh | sed -n ""$i"p" | cut -f1)
        if [[ ! -z "$foldername" ]];
        then
            printf "$i - $foldername, $foldersize\n"
        fi
    done
    
    printf "Total number of files = $(sudo find "$1"* -type f 2> /dev/null | grep -c ^)\n"
    echo "Number of:"
    printf "Configuration files (with the .conf extension) = $(ls -l "$1"*/*.conf 2> /dev/null | egrep -c '^-')\n"
    printf "Text files = $(file "$1"* | grep ":.* text" -c)\n"
    printf "Executable files = $(sudo find "$1"*/* -type f -executable | grep -c ^)\n"
    printf "Log files (with the extension .log) = $(ls -l "$1"*/*.log 2> /dev/null | egrep -c '^-')\n"
    printf "Archive files = $(sudo file "$1"*/* | grep ":.* archive" -c)\n"
    printf "Symbolic links = $(sudo find "$1"* -type l -ls | grep -c ^)\n"

    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    for i in {1..10}
    do
        filename=$(sudo find "$1"* -type f -printf "%kKB %p\n" | sort -rh | sed -n ""$i"p" | cut -d " " -f2)
        filesize=$(sudo find "$1"* -type f -printf "%kKB %p\n" | sort -rh | sed -n ""$i"p" | cut -d " " -f1)
        filetype=$(sudo file "$filename" | cut -d ":" -f2 | cut -d "," -f1)

        if [[ ! -z "$filename" ]];
        then
            echo "$i - $filename, $filesize, $filetype"
        fi
    done
 
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    for i in {1..10}
    do
        filename=$(sudo find "$1"* -type f -executable -printf "%kKB %p\n" | sort -rh | sed -n ""$i"p" | cut -d " " -f2)
        filesize=$(sudo find "$1"* -type f -executable -printf "%kKB %p\n" | sort -rh | sed -n ""$i"p" | cut -d " " -f1)

        if [[ ! -z "$filename" ]];
        then
            sum=$(shasum "$filename" | cut -d " " -f1)
            echo "$i - $filename, $filesize, $sum"
        fi
    done
}
