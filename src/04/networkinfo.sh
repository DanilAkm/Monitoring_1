#!/usr/bin/env bash

NC='\033[0m' # No Color
font1=$1
back1=$2
font2=$3
back2=$4

printf "${font1}${back1}IP${NC} = ${font2}${back2}$(hostname -I)${NC}\n"

netmask=$(ifconfig -a | grep -m 1 "netmask" | cut -d " " -f 13)
printf "${font1}${back1}MASK${NC} = ${font2}${back2}${netmask}${NC}\n"

gateway=$(ip route show | grep "default" | cut -d " " -f 3)
printf "${font1}${back1}GATEWAY${NC} = ${font2}${back2}${gateway}${NC}\n"
