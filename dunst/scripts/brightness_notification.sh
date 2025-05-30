!/bin/bash
# ~/.config/dunst/scripts/brightness_notification.sh
# Custom brightness notification

BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$(( (BRIGHTNESS * 100) / MAX_BRIGHTNESS ))

if [[ $PERCENTAGE -gt 80 ]]; then
    ICON="☀️"
elif [[ $PERCENTAGE -gt 40 ]]; then
    ICON="🌤️"
else
    ICON="🌙"
fi

dunstify -r 2594 -t 2000 -h int:value:$PERCENTAGE -h string:x-canonical-private-synchronous:brightness "$ICON Brightness" "${PERCENTAGE}%"
