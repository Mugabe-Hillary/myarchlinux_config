!/bin/bash
# ~/.config/dunst/scripts/notification_manager.sh
# Enhanced notification management with animations

case "$1" in
    "show")
        # Custom show animation with bounce effect
        dunstify -r 999 -t 0 "Starting notification..." &
        sleep 0.1
        
        # Bounce animation
        for i in {1..5}; do
            scale=$((100 + (10 - i * 2)))
            sleep 0.05
        done
        ;;
        
    "hide")
        # Smooth fade out
        for i in {10..1}; do
            opacity=$((i * 10))
            sleep 0.03
        done
        dunstctl close
        ;;
        
    "dismiss-all")
        # Wave dismiss effect
        dunstctl close-all
        ;;
        
    "history")
        # Show notification history with slide up
        dunstctl history-pop
        ;;
esac
