#!/usr/bin/env bash

NC='\033[0m' # No Color
font1=$1
back1=$2
font2=$3
back2=$4

printf "${font1}${back1}HOSTNAME${NC} = ${font2}${back2}$(hostname)${NC}\n"

timezone=$(timedatectl | grep "Time zone" | cut -d ":" -f 2)
printf "${font1}${back1}TIMEZONE${NC} = ${font2}${back2}${timezone}${NC}\n"

printf "${font1}${back1}USER${NC} = ${font2}${back2}$(whoami)${NC}\n"

os=$(grep 'DESCRIPTION' /etc/*release* | cut -d '"' -f2)
printf "${font1}${back1}OS${NC} = ${font2}${back2}${os}${NC}\n"

printf "${font1}${back1}TIME${NC} = ${font2}${back2}$(date +"%d %B %Y %T")${NC}\n"

printf "${font1}${back1}UPTIME${NC} = ${font2}${back2}$(uptime -p)${NC}\n"

printf "${font1}${back1}UPTIME_SEC${NC} = ${font2}${back2}$(cat /proc/uptime | cut -d "." -f1)${NC}\n"
