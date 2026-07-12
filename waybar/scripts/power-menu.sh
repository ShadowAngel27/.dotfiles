#!/usr/bin/env bash
# Power menu — with toggle support

if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

options="Lock\nLogout\nSuspend\nHibernate\nReboot\nShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -theme ~/.config/rofi/power-menu.rasi)

case "$chosen" in
    "Lock")
        hyprlock
        ;;
    "Logout")
        hyprctl dispatch 'hl.dsp.exit()'
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    *)
        exit 0
        ;;
esac