#!/bin/bash

# Set the background image path (change to your desired image path)
# BACKGROUND_IMAGE="/home/nishanth/Pictures/wallpapers/lockscr.jpg"
BACKGROUND_IMAGE="/home/nishanth/Pictures/wallpapers/bluescreenofdeath.jpg"

# Get the screen resolution (e.g., 1920x1080 for Full HD)
SCREEN_RESOLUTION=$(xrandr | grep '*' | awk '{print $1}')

# Set text color and font settings
TEXT_COLOR="white"  # Change to your preferred text color
FONT="Jetbrains Mono"  # Change this to any available font
FONT_SIZE="120"  # Adjust font size as needed

# Resize the background image to the screen resolution
convert "$BACKGROUND_IMAGE" -resize "$SCREEN_RESOLUTION!" /tmp/lock_background.jpg

# Add the current time on the image
convert /tmp/lock_background.jpg -gravity center -font "$FONT" -pointsize "$FONT_SIZE" \
    -fill "$TEXT_COLOR" -annotate +0+0 "$(date '+%H:%M:%S')" /tmp/lock_screen.png

# Lock the screen with the generated image and no unlock indicator
i3lock -i /tmp/lock_screen.png -f -e

# Clean up the temporary lock screen image
rm /tmp/lock_background.jpg /tmp/lock_screen.png



