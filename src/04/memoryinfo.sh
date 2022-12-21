#!/usr/bin/env bash

NC='\033[0m' # No Color
font1=$1
back1=$2
font2=$3
back2=$4

printf "${font1}${back1}RAM_TOTAL${NC} = "
memtotal=$(grep MemTotal /proc/meminfo | tr '\t' ' ' | cut -d " " -f 9)
memtotalgb=$(printf 'scale=3; %s / 1024 / 1024\n' "$memtotal" | bc)
printf "${font2}${back2}$memtotalgb GB${NC}\n"

printf "${font1}${back1}RAM_USED${NC} = "
memused=$(free | grep "Mem" | tr '\t' ' ' | cut -d " " -f 15)
memusedgb=$(printf 'scale=3; %s / 1024 / 1024\n' "$memused" | bc)
printf "${font2}${back2}$memusedgb GB${NC}\n"

printf "${font1}${back1}RAM_FREE${NC} = "
memfreegb=$(echo "scale=3; $(free | grep "Mem" | awk '{split($4,a); print a[1]}')/1024/1024" | bc)
printf "${font2}${back2}$memfreegb GB${NC}\n"

printf "${font1}${back1}SPACE_ROOT${NC} = "
spaceroot=$(df -k / | grep "/dev/" | cut -d " " -f 4)
spacerootmb=$(printf 'scale=2; %s / 1024\n' "$spaceroot" | bc )
printf "${font2}${back2}$spacerootmb MB${NC}\n"

printf "${font1}${back1}SPACE_ROOT_USED${NC} = "
spaceroot_used=$(df -k / | grep "/dev/" | cut -d " " -f 5)
spaceroot_usedmb=$(printf 'scale=2; %s / 1024\n' "$spaceroot_used" | bc)
printf "${font2}${back2}$spaceroot_usedmb MB${NC}\n"


printf "${font1}${back1}SPACE_ROOT_FREE${NC} = "
spaceroot_free=$(df -k / | grep "/dev/" | cut -d " " -f 8)
spaceroot_freemb=$(printf 'scale=2; %s / 1024\n' "$spaceroot_free" | bc)
printf "${font2}${back2}$spaceroot_freemb MB${NC}\n"
