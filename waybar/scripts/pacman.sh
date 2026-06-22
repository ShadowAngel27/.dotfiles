#!/usr/bin/env bash
# ~/.config/waybar/scripts/pacman.sh
# Shows pending update count. Click to run update in terminal.
# Requires: pacman-contrib (for checkupdates)
# pacman -S pacman-contrib

count=$(checkupdates 2>/dev/null | wc -l)

if [[ "$count" -eq 0 ]]; then
    printf '{"text":"PKG ok","tooltip":"System up to date","class":"updated"}\n'
elif [[ "$count" -ge 50 ]]; then
    printf '{"text":"PKG %d","tooltip":"%d updates available","class":"critical"}\n' "$count" "$count"
elif [[ "$count" -ge 10 ]]; then
    printf '{"text":"PKG %d","tooltip":"%d updates available","class":"warning"}\n' "$count" "$count"
else
    printf '{"text":"PKG %d","tooltip":"%d updates available","class":"normal"}\n' "$count" "$count"
fi
