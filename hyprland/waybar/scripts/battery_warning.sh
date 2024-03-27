#!/bin/sh

CAP=$(cat /sys/class/power_supply/BAT*/capacity)
LOW_BAT=20
FULL_BAT=100

if [[ $CAP == $FULL_BAT ]]; then
  notify-send "FULL BATTERY"
elif [[ $CAP -lt $LOW_BAT ]]; then
  notify-send -u critical "WARNING: LOW BATTERY"
fi
