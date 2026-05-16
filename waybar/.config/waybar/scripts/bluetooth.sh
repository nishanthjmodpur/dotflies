#!/bin/bash

status=$(bluetoothctl show | awk '/Powered/ {print $2}')

if [ "$status" != "yes" ]; then
    echo " Off"
    exit 0
fi

connected_device=$(bluetoothctl devices Connected | head -n1)

if [ -z "$connected_device" ]; then
    echo " On"
    exit 0
fi

mac=$(echo "$connected_device" | awk '{print $2}')
name=$(echo "$connected_device" | cut -d ' ' -f3-)

battery=$(bluetoothctl info "$mac" \
    | awk -F'[()]' '/Battery Percentage/ {gsub("%","",$2); print $2}')

if [ -n "$battery" ]; then
	echo " $name (${battery}%)"
else
    echo " $name"
fi
