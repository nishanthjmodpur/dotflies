#!/bin/zsh

THEME="$HOME/.config/rofi/wifi.rasi"

# Get clean SSID list
WIFI_LIST=$(iwctl station wlan0 get-networks \
    | tail -n +5 \
    | sed '/^$/d' \
    | sed 's/\x1b\[[0-9;]*m//g' \
    | sed 's/^>//' \
    | awk '{$1=$1};1')

CHOSEN=$(echo "$WIFI_LIST" | rofi \
    -dmenu \
    -i \
    -p "WIFI" \
    -theme "$THEME")

[ -z "$CHOSEN" ] && exit

# Extract SSID safely
SSID=$(echo "$CHOSEN" | awk '
{
    ssid=""
    for(i=1;i<=NF;i++) {
        if($i ~ /^(psk|open|802\.1x)/) break
        ssid = ssid (ssid ? OFS : "") $i
    }
    print ssid
}')

# Ask password
PASSWORD=$(rofi -dmenu -password -p "Password" -theme "$THEME")

# Connect
if [ -n "$PASSWORD" ]; then
    iwctl --passphrase "$PASSWORD" station wlan0 connect "$SSID"
else
    iwctl station wlan0 connect "$SSID"
fi
