# !/bin/bash

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ $CURRENT_THEME = "'prefer-dark'" ]; then
    echo "setting light because it's $CURRENT_THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    echo "setting dark because it's $CURRENT_THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
