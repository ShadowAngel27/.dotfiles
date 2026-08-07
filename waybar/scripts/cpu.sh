#!/usr/bin/env bash
idle=$(top -bn1 | grep "Cpu(s)" | grep -oP '[\d,]+(?=\s*id)' | tr ',' '.')
usage=$(awk -v i="$idle" 'BEGIN{printf "%.0f", 100-i}')
temp="N/A"
for hwmon in /sys/class/hwmon/hwmon*; do
    if [[ "$(cat $hwmon/name 2>/dev/null)" == "k10temp" ]]; then
        raw=$(cat "$hwmon/temp1_input" 2>/dev/null)
        temp="$((raw / 1000))"
        break
    fi
done
class="normal"
if [[ "$usage" -ge 90 || "$temp" != "N/A" && "$temp" -ge 90 ]]; then
    class="critical"
elif [[ "$usage" -ge 70 || "$temp" != "N/A" && "$temp" -ge 75 ]]; then
    class="warning"
fi
printf '{"text":"CPU %s%% %s°","tooltip":"Usage: %s%% | Temp: %s°C","class":"%s"}\n' \
    "$usage" "$temp" "$usage" "$temp" "$class"
