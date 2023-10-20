#!/bin/sh

#this script is used to hide and show the polybar usign Super + X

DIR=/tmp
ST=$(cat $DIR/POLYBAR_STATE.txt)

if [[ $ST == "ON" ]]; then
    ST="OFF"
    polybar-msg cmd hide
    bspc config -m focused top_padding $(( $(bspc config -m focused top_padding) - 25 ))
else
    ST="ON"
    polybar-msg cmd show
    bspc config -m focused top_padding $(( $(bspc config -m focused top_padding) + 25 ))
fi

echo $ST > $DIR/POLYBAR_STATE.txt
