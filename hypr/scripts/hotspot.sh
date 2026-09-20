#!/bin/bash

# Check if create_ap is running
if pgrep -x "create_ap" > /dev/null; then
    if [ "$1" == "toggle" ]; then
        sudo create_ap --stop wlan0
    else
        echo '{"text": "󰤨 Hotspot", "class": "active", "tooltip": "Hotspot Active"}'
    fi
else
    if [ "$1" == "toggle" ]; then
        sudo create_ap -n wlan0 enp3s0 MyHotspot YourPassword123 &
    else
        echo '{"text": "󰤩 Off", "class": "inactive", "tooltip": "Hotspot Off"}'
    fi
fi
