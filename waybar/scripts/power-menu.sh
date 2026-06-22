#!/usr/bin/env bash
# ~/.config/waybar/scripts/power-menu.sh

chosen=$(printf "  Lock\n  Sleep\n  Hibernate\n  Logout\n  Reboot\n  Shutdown" | \
    rofi -dmenu \
         -p "power" \
         -theme ~/.config/rofi/power-menu.rasi)

case "$chosen" in
    *Lock)      hyprlock ;;
    *Sleep)     systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Logout)    hyprctl dispatch exit ;;
    *Reboot)    systemctl reboot ;;
    *Shutdown)  systemctl poweroff ;;
esac
