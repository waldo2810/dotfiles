#!/bin/bash

# Path to the GTK settings file
GTK_SETTINGS_FILE="$HOME/.config/gtk-3.0/settings.ini"

# Check if the settings file exists
if [ ! -f "$GTK_SETTINGS_FILE" ]; then
  echo "GTK settings file not found, creating it..."
  mkdir -p "$HOME/.config/gtk-3.0"
  echo "[Settings]" > "$GTK_SETTINGS_FILE"
fi

# Read the current dark theme setting
CURRENT_SETTING=$(grep "gtk-application-prefer-dark-theme" "$GTK_SETTINGS_FILE" | cut -d '=' -f 2)

# Toggle the setting
if [ "$CURRENT_SETTING" == "1" ]; then
  echo "Switching to light theme..."
  sed -i 's/gtk-application-prefer-dark-theme=1/gtk-application-prefer-dark-theme=0/' "$GTK_SETTINGS_FILE"
else
  echo "Switching to dark theme..."
  if grep -q "gtk-application-prefer-dark-theme" "$GTK_SETTINGS_FILE"; then
    sed -i 's/gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/' "$GTK_SETTINGS_FILE"
  else
    echo "gtk-application-prefer-dark-theme=1" >> "$GTK_SETTINGS_FILE"
  fi
fi

# Notify the user
echo "Theme toggle complete!"

