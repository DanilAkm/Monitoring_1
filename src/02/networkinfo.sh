#!/usr/bin/env bash

echo -n "IP = "
hostname -I

echo -n "MASK = "
ifconfig -a | grep -m 1 "netmask" | cut -d " " -f 13

echo -n "GATEWAY = "
ip route show | grep "default" | cut -d " " -f 3
