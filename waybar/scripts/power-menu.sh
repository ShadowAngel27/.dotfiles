#!/usr/bin/env bash
if pgrep -x rofi > /dev/null; then
    hyprctl dispatch 'hl.dsp.send_shortcut({ mods = "", key = "Escape" })'
    exit 0
fi

options="Lock\nLogout\nSuspend\nHibernate\nReboot\nShutdown"
chosen=$(echo -e "$options" | rofi -dmenu -i -theme ~/.config/rofi/power-menu.rasi)

case "$chosen" in
    "Lock") hyprlock ;;
    "Logout") hyprctl dispatch 'hl.dsp.exit()' ;;
    "Suspend") systemctl suspend ;;
    "Hibernate") systemctl hibernate ;;
    "Reboot") systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
    *) exit 0 ;;
esac