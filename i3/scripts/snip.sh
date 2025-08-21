#!/bin/bash

# export DISPLAY=:0
# # Define the screenshot filename with timestamp
# FILENAME="$HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
# # Take the screenshot and save it to the defined file
# sleep 0.2
#
# gnome-screenshot -a --file="$FILENAME" &
#
# # Copy the screenshot to the clipboard
# xclip -selection clipboard -t image/png -i "$FILENAME"


export DISPLAY=:0

# Define the screenshot filename with timestamp
FILENAME="$HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

# Take the screenshot and save it to the defined file
gnome-screenshot -a --file="$FILENAME" &

# Wait a moment for the screenshot to be written to disk
sleep 1

# Check if the screenshot file was successfully created
if [[ -f "$FILENAME" ]]; then
    # Copy the screenshot to the clipboard
    xclip -selection clipboard -t image/png -i "$FILENAME"
else
    echo "Screenshot file not found: $FILENAME"
fi
