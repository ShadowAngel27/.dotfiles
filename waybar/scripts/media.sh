#!/usr/bin/env bash
# ~/.config/waybar/scripts/media.sh
# Shows media controls in waybar when something is playing.
# Click = toggle eww popup. Right-click = play/pause (set in config).

POPUP_NAME="media-popup"

toggle_popup() {
    if eww active-windows 2>/dev/null | grep -q "$POPUP_NAME"; then
        eww close "$POPUP_NAME"
    else
        eww open "$POPUP_NAME"
    fi
    exit 0
}

[[ "$1" == "toggle-popup" ]] && toggle_popup

# Check if anything is playing
status=$(playerctl status 2>/dev/null)

if [[ -z "$status" || "$status" == "No players found" ]]; then
    printf '{"text":"","class":"stopped"}\n'
    exit 0
fi

title=$(playerctl metadata title 2>/dev/null | cut -c1-30)
artist=$(playerctl metadata artist 2>/dev/null | cut -c1-20)

if [[ "$status" == "Playing" ]]; then
    class="playing"
    controls="[⏮] [⏯] [⏭]"
elif [[ "$status" == "Paused" ]]; then
    class="paused"
    controls="[⏮] [▐▐] [⏭]"
fi

# Truncate and show
if [[ -n "$artist" ]]; then
    display="${controls}  ${artist} — ${title}"
else
    display="${controls}  ${title}"
fi

tooltip="$(playerctl metadata artist 2>/dev/null) — $(playerctl metadata title 2>/dev/null)\nAlbum: $(playerctl metadata album 2>/dev/null)\nStatus: $status"

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$display" "$tooltip" "$class"
