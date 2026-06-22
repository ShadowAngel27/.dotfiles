#!/usr/bin/env bash

usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | cut -d',' -f1 | xargs printf "%.0f")

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