#!/bin/bash

while true; do
    # Get current date and time in the desired format (e.g., Jun 20 2025)
    DATE=$(date +'%b %d %Y %X')

    # Get CPU usage (load average over 1 minute as a percentage)
    CPU_LOAD=$(cut -d " " -f 1 /proc/loadavg)
    CPU_CORES=$(nproc)  # Get the number of CPU cores
    CPU_PERCENT=$(awk "BEGIN {print ($CPU_LOAD / $CPU_CORES) * 100}")

    # Get RAM usage (used/total as a percentage)
    MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    MEM_AVAILABLE=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    MEM_USED=$((MEM_TOTAL - MEM_AVAILABLE))
    MEM_PERCENT=$(awk "BEGIN {print ($MEM_USED / $MEM_TOTAL) * 100}")

    # Check connection type (Wi-Fi or LAN)
    CONNECTION_TYPE=$(nmcli -t -f TYPE,NAME connection show --active | grep -E '^802-11-wireless|^ethernet')
    if [[ $CONNECTION_TYPE == *"802-11-wireless"* ]]; then
        CONNECTION_NAME=$(echo $CONNECTION_TYPE | grep '802-11-wireless' | cut -d ":" -f 2)
        CONNECTION_STATUS="wifi: $CONNECTION_NAME"
    elif [[ $CONNECTION_TYPE == *"ethernet"* ]]; then
        CONNECTION_NAME=$(echo $CONNECTION_TYPE | grep 'eth' | cut -d ":" -f 2)
        IP_ADDRESS=$(ip addr show $CONNECTION_NAME | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
        CONNECTION_STATUS="LAN: $CONNECTION_NAME (IP: $IP_ADDRESS)"
    else
        CONNECTION_STATUS="No internet"
    fi

    # Get battery status
    BATTERY_PATH=$(upower -e | grep 'BAT')
    if [[ -n $BATTERY_PATH ]]; then
        BATTERY_PERCENT=$(upower -i "$BATTERY_PATH" | grep -E "percentage" | awk '{print $2}')
        BATTERY_STATUS=$(upower -i "$BATTERY_PATH" | grep -E "state" | awk '{print $2}')
        BATTERY_INFO="$BATTERY_PERCENT ($BATTERY_STATUS)"
    else
        BATTERY_INFO="Battery: Not Available"
    fi

    # Get volume status (using pactl)
    SINK=$(pactl list short sinks | awk '{print $1}' | head -1)
    VOLUME_LEVEL=$(pactl get-sink-volume "$SINK" | grep -oP '\d+%' | head -1)
    IS_MUTED=$(pactl get-sink-mute "$SINK" | grep -o "yes")
    if [[ $IS_MUTED == "yes" ]]; then
        VOLUME_STATUS="Muted"
    else
        VOLUME_STATUS="$VOLUME_LEVEL"
    fi

    # Get simplified keyboard layout
    LAYOUT=$(swaymsg -t get_inputs | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' | head -1)
    case "$LAYOUT" in
        "Spanish (Latin American)") SIMPLE_LAYOUT="latam" ;;
        "English (US)") SIMPLE_LAYOUT="us" ;;
        *) SIMPLE_LAYOUT="unknown" ;;  # Default case if no match
    esac
    LAYOUT_INFO=$SIMPLE_LAYOUT

    # Format and print the status
    echo "cpu: ${CPU_PERCENT%%.*}% | mem: ${MEM_PERCENT%%.*}% | vol: $VOLUME_STATUS | bat: $BATTERY_INFO $CONNECTION_STATUS | keyb: $LAYOUT_INFO | $DATE"

    sleep 1
done
