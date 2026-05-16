# #!/bin/zsh

THEME="$HOME/.config/rofi/wifi.rasi"

WIFI_LIST=$(iwctl station wlan0 get-networks \
    | tail -n +5 \
    | sed '/^$/d' \
	| sed 's/\x1b\[[0-9;]*m//g')

CHOSEN=$(echo "$WIFI_LIST" | rofi \
    -dmenu \
    -i \
    -p "WIFI" \
    -theme "$THEME")

[ -z "$CHOSEN" ] && exit

SSID=$(echo "$CHOSEN" | awk '{print $1}')

iwctl station wlan0 connect "$SSID"
