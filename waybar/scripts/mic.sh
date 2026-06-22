#!/usr/bin/env bash
# ~/.config/waybar/scripts/mic.sh

muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null | grep -c '\[MUTED\]')

if [[ "$muted" -gt 0 ]]; then
    printf '{"text":"MIC OFF","tooltip":"Microphone muted — click to unmute","class":"muted"}\n'
else
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null | awk '{printf "%d", $2*100}')
    printf '{"text":"MIC %d%%","tooltip":"Microphone active — click to mute","class":"active"}\n' "$vol"
fi
