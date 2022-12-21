#!/usr/bin/env bash

echo -n "HOSTNAME = "
hostname

echo -n "TIMEZONE = "
timedatectl | grep "Time zone" | cut -d ":" -f 2

echo -n "USER = "
whoami

echo -n "OS = "
echo $(grep 'DESCRIPTION' /etc/*release* | cut -d '"' -f2)

echo -n "TIME = "
date +"%d %B %Y %T"

echo -n "UPTIME = "
uptime -p

echo -n "UPTIME_SEC = "
cat /proc/uptime | cut -d "." -f1
