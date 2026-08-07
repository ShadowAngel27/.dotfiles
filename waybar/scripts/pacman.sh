#!/usr/bin/env bash
# ~/.config/waybar/scripts/pacman.sh
# Shows pending update count (official + AUR). Click to run update in terminal.
# Requires: pacman-contrib (for checkupdates), paru (for AUR)
official=$(checkupdates 2>/dev/null | wc -l)
aur=$(paru -Qua 2>/dev/null | wc -l)
count=$((official + aur))

if [[ "$count" -eq 0 ]]; then
    printf '{"text":"PKG ok","tooltip":"System up to date","class":"updated"}\n'
elif [[ "$count" -ge 50 ]]; then
    printf '{"text":"PKG %d","tooltip":"%d official + %d AUR updates available","class":"critical"}\n' "$count" "$official" "$aur"
elif [[ "$count" -ge 10 ]]; then
    printf '{"text":"PKG %d","tooltip":"%d official + %d AUR updates available","class":"warning"}\n' "$count" "$official" "$aur"
else
    printf '{"text":"PKG %d","tooltip":"%d official + %d AUR updates available","class":"normal"}\n' "$count" "$official" "$aur"
fi