#!/bin/bash
# ~/.config/dunst/scripts/slide_in.sh
# Smooth slide-in animation for notifications

# Get notification window ID
NOTIFICATION_ID=$1

# Slide in from right with easing
for i in {1..20}; do
    offset=$((300 - (i * 15)))
    opacity=$((i * 5))
    
    # Use hyprctl to animate if available, otherwise use standard positioning
    if command -v hyprctl &> /dev/null; then
        hyprctl dispatch movewindow $offset,50
        hyprctl dispatch opacity $((opacity))% 
    fi
    
    sleep 0.02
done
