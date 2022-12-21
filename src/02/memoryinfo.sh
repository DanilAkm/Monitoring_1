#!/usr/bin/env bash

echo -n "RAM_TOTAL = "
memtotal=$(grep MemTotal /proc/meminfo | tr '\t' ' ' | cut -d " " -f 9)
memtotalgb=$(printf 'scale=3; %s / 1024 / 1024\n' "$memtotal" | bc)
echo "$memtotalgb GB"

echo -n "RAM_USED = "
memused=$(free | grep "Mem" | tr '\t' ' ' | cut -d " " -f 15)
memusedgb=$(printf 'scale=3; %s / 1024 / 1024\n' "$memused" | bc)
echo "$memusedgb GB"

echo -n "RAM_FREE = "
memfreegb=$(echo "scale=3; $(free | grep "Mem" | awk '{split($4,a); print a[1]}')/1024/1024" | bc)
echo "$memfreegb GB"

echo -n "SPACE_ROOT = "
spaceroot=$(df -k / | grep "/dev" | awk '{split($2,a); print a[1]}')
spacerootmb=$(printf 'scale=2; %s / 1024\n' "$spaceroot" | bc)
echo "$spacerootmb MB"

echo -n "SPACE_ROOT_USED = "
spaceoot_used=$(df -k / | grep "/dev" | awk '{split($3,a); print a[1]}')
spaceoot_usedmb=$(printf 'scale=2; %s / 1024\n' "$spaceoot_used" | bc)
echo "$spaceoot_usedmb MB"

echo -n "SPACE_ROOT_FREE = "
spaceroot_free=$(df -k / | grep "/dev" | awk '{split($4,a); print a[1]}')
spaceroot_freemb=$(printf 'scale=2; %s / 1024\n' "$spaceroot_free" | bc)
echo "$spaceroot_freemb MB"
