!/bin/bash
# ~/.config/dunst/scripts/volume_notification.sh
# Custom volume notification with progress bar animation

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED" || echo "")

if [[ -n "$MUTED" ]]; then
    ICON="🔇"
    dunstify -r 2593 -t 2000 -h int:value:0 -h string:x-canonical-private-synchronous:volume "$ICON Volume" "Muted"
else
    if [[ $VOLUME -gt 70 ]]; then
        ICON="🔊"
    elif [[ $VOLUME -gt 30 ]]; then
        ICON="🔉"
    else
        ICON="🔈"
    fi
    
    # Animated progress bar
    dunstify -r 2593 -t 2000 -h int:value:$VOLUME -h string:x-canonical-private-synchronous:volume "$ICON Volume" "${VOLUME}%"
fi
