# !/bin/bash

while true; do
    if ! ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
        echo "$(date) - Wi-Fi Disconnected" >> wifi_log.txt
    fi
    sleep 1
done
