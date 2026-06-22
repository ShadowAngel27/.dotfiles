#!/usr/bin/env bash
# ~/.config/waybar/scripts/amd-gpu.sh

usage="N/A"
temp="N/A"

for card in /sys/class/drm/card*; do
    if [[ -f "$card/device/gpu_busy_percent" ]]; then
        usage=$(cat "$card/device/gpu_busy_percent" 2>/dev/null)
        break
    fi
done

for hwmon in /sys/class/hwmon/hwmon*; do
    if [[ "$(cat $hwmon/name 2>/dev/null)" == "amdgpu" ]]; then
        raw=$(cat "$hwmon/temp1_input" 2>/dev/null)
        temp="$((raw / 1000))"
        break
    fi
done

class="normal"
if [[ "$temp" != "N/A" && "$temp" -ge 95 ]]; then
    class="critical"
elif [[ "$temp" != "N/A" && "$temp" -ge 80 ]]; then
    class="warning"
fi

printf '{"text":"iGPU %s%% %s°","tooltip":"AMD Radeon 780M | Usage: %s%% | Temp: %s°C","class":"%s"}\n' \
    "$usage" "$temp" "$usage" "$temp" "$class"
