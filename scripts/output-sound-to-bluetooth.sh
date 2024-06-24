#!/bin/bash

# Function to get the current default sink
get_default_sink() {
    pactl get-default-sink
}

# Function to get the Bluetooth sink if available
get_bluetooth_sink() {
    pactl list short sinks | grep bluez_output | awk '{print $2}'
}

# Define the fallback sink
FALLBACK_SINK="alsa_output.pci-0000_04_00.6.analog-stereo"

# Get the current default sink and Bluetooth sink
CURRENT_SINK=$(get_default_sink)
BLUETOOTH_SINK=$(get_bluetooth_sink)

# Set the default sink to Bluetooth if available, otherwise to fallback
if [ -n "$BLUETOOTH_SINK" ]; then
    pactl set-default-sink "$BLUETOOTH_SINK"
else
    pactl set-default-sink "$FALLBACK_SINK"
fi

# Move all sink inputs to the new default sink
NEW_DEFAULT_SINK=$(get_default_sink)
for SINK_INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$SINK_INPUT" "$NEW_DEFAULT_SINK"
done
