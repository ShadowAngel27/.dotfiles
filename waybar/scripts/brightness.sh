#!/usr/bin/env bash
current=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/brightness)
max=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/max_brightness)
pct=$(awk -v c="$current" -v m="$max" 'BEGIN{printf "%d", (c/m)*100}')
printf '{"text":"BRT %d%%","tooltip":"Brightness: %d%%"}\n' "$pct" "$pct"
