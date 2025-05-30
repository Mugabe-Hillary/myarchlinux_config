!/bin/bash
# ~/.config/dunst/scripts/fade_effect.sh  
# Smooth fade effect for notifications

NOTIFICATION_ID=$1
DURATION=${2:-0.3}

# Fade in effect
for i in {1..10}; do
    opacity=$((i * 10))
    
    if command -v hyprctl &> /dev/null; then
        hyprctl dispatch opacity ${opacity}%
    fi
    
    sleep $(echo "$DURATION / 10" | bc -l)
done
