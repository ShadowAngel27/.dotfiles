#!/usr/bin/env bash
# ~/.config/eww/scripts/media-info.sh
# Polls playerctl and updates eww variables in a loop.
# Run as daemon from eww.yuck on widget open.

update() {
    status=$(playerctl status 2>/dev/null)
    if [[ -z "$status" || "$status" == "No players found" ]]; then
        eww update media_title="Nothing playing"
        eww update media_artist=""
        eww update media_album=""
        eww update media_art=""
        eww update media_status="stopped"
        eww update media_pos=0
        eww update media_len=1
        return
    fi

    title=$(playerctl metadata title 2>/dev/null)
    artist=$(playerctl metadata artist 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    art=$(playerctl metadata mpris:artUrl 2>/dev/null | sed 's|file://||')
    pos=$(playerctl position 2>/dev/null | awk '{printf "%d", $1}')
    len=$(playerctl metadata mpris:length 2>/dev/null | awk '{printf "%d", $1/1000000}')

    [[ -z "$len" || "$len" -eq 0 ]] && len=1
    [[ -z "$pos" ]] && pos=0

    eww update media_title="${title:-Unknown}"
    eww update media_artist="${artist:-Unknown}"
    eww update media_album="${album:-}"
    eww update media_art="${art:-}"
    eww update media_status="${status,,}"   # lowercase: playing/paused
    eww update media_pos="$pos"
    eww update media_len="$len"
}

# Loop every second
while true; do
    update
    sleep 1
done
