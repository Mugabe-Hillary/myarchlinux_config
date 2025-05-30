!/bin/bash
# ~/.config/dunst/scripts/media_notification.sh
# Enhanced media notifications

PLAYER_STATUS=$(playerctl status 2>/dev/null)
TITLE=$(playerctl metadata title 2>/dev/null)
ARTIST=$(playerctl metadata artist 2>/dev/null)
ALBUM=$(playerctl metadata album 2>/dev/null)

if [[ -n "$TITLE" && -n "$ARTIST" ]]; then
    case "$PLAYER_STATUS" in
        "Playing")
            ICON="▶️"
            ;;
        "Paused")
            ICON="⏸️"
            ;;
        *)
            ICON="🎵"
            ;;
    esac
    
    # Rich media notification
    dunstify -r 2595 -t 4000 -h string:x-canonical-private-synchronous:media \
        "$ICON Now $PLAYER_STATUS" \
        "$TITLE\n<i>by $ARTIST</i>${ALBUM:+\n<i>from $ALBUM</i>}"
fi
