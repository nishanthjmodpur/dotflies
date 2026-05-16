#!/bin/zsh

THEME="$HOME/.config/rofi/bluetooth.rasi"

# Get paired + available bluetooth devices
DEVICE_LIST=$(bluetoothctl devices | sed 's/^Device //')

CHOSEN=$(echo "$DEVICE_LIST" | rofi \
    -dmenu \
    -i \
    -p "Bluetooth" \
    -theme "$THEME")

[ -z "$CHOSEN" ] && exit

# Extract MAC + Device Name
MAC=$(echo "$CHOSEN" | awk '{print $1}')
NAME=$(echo "$CHOSEN" | cut -d' ' -f2-)

# Check current connection state
CONNECTED=$(bluetoothctl info "$MAC" | grep "Connected: yes")

if [ -n "$CONNECTED" ]; then
    bluetoothctl disconnect "$MAC"
    notify-send "Bluetooth" "Disconnected from $NAME"
else
    bluetoothctl connect "$MAC"
    notify-send "Bluetooth" "Connected to $NAME"
fi
