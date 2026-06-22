#!/usr/bin/env bash
# ~/.config/waybar/scripts/nvidia-gpu.sh

if ! command -v nvidia-smi &>/dev/null; then
    printf '{"text":"NVGPU N/A","tooltip":"nvidia-smi not found","class":"normal"}\n'
    exit 0
fi

read -r usage temp vram_used vram_total < <(
    nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total \
               --format=csv,noheader,nounits | tr -d ' ' | tr ',' ' '
)

class="normal"
if [[ -n "$temp" && "$temp" -ge 90 ]]; then
    class="critical"
elif [[ -n "$temp" && "$temp" -ge 75 ]]; then
    class="warning"
fi

vram_used_g=$(awk "BEGIN {printf \"%.1f\", $vram_used/1024}")
vram_total_g=$(awk "BEGIN {printf \"%.1f\", $vram_total/1024}")

printf '{"text":"NVGPU %s%% %s°","tooltip":"NVIDIA RTX 4070 | Usage: %s%% | Temp: %s°C | VRAM: %s/%sG","class":"%s"}\n' \
    "$usage" "$temp" "$usage" "$temp" "$vram_used_g" "$vram_total_g" "$class"
