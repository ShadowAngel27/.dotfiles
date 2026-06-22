#!/usr/bin/env bash
# ~/.config/waybar/scripts/temps.sh
# Reads CPU (k10temp) temperature.
# Requires: lm_sensors (pacman -S lm_sensors && sudo sensors-detect)

cpu_temp=""
amd_gpu_temp=""

# Find k10temp (CPU)
for hwmon in /sys/class/hwmon/hwmon*; do
    name=$(cat "$hwmon/name" 2>/dev/null)
    if [[ "$name" == "k10temp" ]]; then
        raw=$(cat "$hwmon/temp1_input" 2>/dev/null)
        cpu_temp="$((raw / 1000))"
        break
    fi
done

# Find amdgpu (iGPU)
for hwmon in /sys/class/hwmon/hwmon*; do
    name=$(cat "$hwmon/name" 2>/dev/null)
    if [[ "$name" == "amdgpu" ]]; then
        raw=$(cat "$hwmon/temp1_input" 2>/dev/null)
        amd_gpu_temp="$((raw / 1000))"
        break
    fi
done

cpu_temp=${cpu_temp:-"N/A"}
amd_gpu_temp=${amd_gpu_temp:-"N/A"}

# Warning/critical thresholds
class="normal"
if [[ "$cpu_temp" != "N/A" && "$cpu_temp" -ge 90 ]]; then
    class="critical"
elif [[ "$cpu_temp" != "N/A" && "$cpu_temp" -ge 75 ]]; then
    class="warning"
fi

text="TMP CPU:${cpu_temp}° iGPU:${amd_gpu_temp}°"
tooltip="CPU:  ${cpu_temp}°C\niGPU: ${amd_gpu_temp}°C"

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$text" "$tooltip" "$class"
