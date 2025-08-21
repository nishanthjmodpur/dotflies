#!/bin/bash

# Define the screenshot filename with timestamp
FILENAME="$HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

# Take the screenshot and save it to the defined file
gnome-screenshot --file="$FILENAME"

# Copy the screenshot to the clipboard
xclip -selection clipboard -t image/png -i "$FILENAME"
