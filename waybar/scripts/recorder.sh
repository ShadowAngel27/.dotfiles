#!/usr/bin/env bash
# ~/.config/waybar/scripts/recorder.sh

RECORDINGS_DIR="$HOME/Videos/Recordings"
mkdir -p "$RECORDINGS_DIR"
PIDFILE="/tmp/wf-recorder.pid"

status() {
    if pgrep -x wf-recorder &>/dev/null; then
        printf '{"text":"[●REC]","tooltip":"Recording — click to stop","class":"recording"}\n'
    else
        printf '{"text":"[REC]","tooltip":"Click to start recording","class":"stopped"}\n'
    fi
}

case "$1" in
    toggle)
        if pgrep -x wf-recorder &>/dev/null; then
            pkill -INT wf-recorder
            sleep 0.5
        else
            OUTPUT="$RECORDINGS_DIR/$(date +%Y%m%d_%H%M%S).mp4"
            wf-recorder -f "$OUTPUT" &
            echo $! > "$PIDFILE"
        fi
        # Signal waybar to refresh this module
        pkill -RTMIN+9 waybar
        ;;
    *)
        status
        ;;
esac
