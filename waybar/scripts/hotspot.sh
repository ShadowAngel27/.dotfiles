#!/bin/bash

if pgrep -f "create_ap" > /dev/null; then
    if [ "$1" == "toggle" ]; then
        sudo /usr/bin/create_ap --stop wlan0 >/dev/null 2>&1
        sudo /usr/bin/killall -q hostapd dnsmasq create_ap >/dev/null 2>&1
        sudo /usr/bin/nmcli r wifi on >/dev/null 2>&1
    else
        echo '{"text": "HOTSPOT [ON]", "alt": "active", "tooltip": "Hotspot Active"}'
    fi
else
    if [ "$1" == "toggle" ]; then
        sudo /usr/bin/killall -q hostapd dnsmasq create_ap >/dev/null 2>&1
        sudo /usr/bin/nmcli r wifi off >/dev/null 2>&1
        sudo /usr/bin/rfkill unblock wlan >/dev/null 2>&1
        sudo /usr/bin/rm -rf /tmp/create_ap.*
        sudo /usr/bin/create_ap --no-virt --daemon wlan0 enp3s0 Hypr 12345678 >/dev/null 2>&1
    else
        echo '{"text": "HOTSPOT [OFF]", "alt": "inactive", "tooltip": "Hotspot Inactive"}'
    fi
fi
