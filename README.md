# Dotfiles

## Requirements
- fzf
- ripgrep

## X11 conf
X11 provides configurations in a directory “X11/xorg.conf.d/” this directory could live in various places on your system depending on your distribution.
However, X11 will always attempt to also load configurations from `/etc/X11/xorg.conf.d/` when present.

To ensure the directory exists, run:

    sudo mkdir -p /etc/X11/xorg.conf.d

### Touchpad
[see reference](https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/)
Next we’ll create a new file “90-touchpad.conf”. The configuration file names end with .conf and are read in ASCII order—by convention file names begin with two digits followed by a dash.

    sudo touch /etc/X11/xorg.conf.d/90-touchpad.conf

Now open up the file your editor of choice (with suitable write permission of course) and paste the following:

    Section "InputClass"
            Identifier "touchpad"
            MatchIsTouchpad "on"
            Driver "libinput"
            Option "Tapping" "on"
    EndSection

Additional libinput options
Libinput support additional options beyond tapping, you can add and configure each one by adding them on new lines after Option "Tapping" "on" in your /etc/X11/xorg.conf.d/90-touchpad.conf, for example:

    Section "InputClass"
            Identifier "touchpad"
            MatchIsTouchpad "on"
            Driver "libinput"
            Option "Tapping" "on"
            Option "TappingButtonMap" "lrm"
            Option "NaturalScrolling" "on"
            Option "ScrollMethod" "twofinger"
    EndSection

### Keyboard Layout
[see reference](https://superuser.com/a/1783778)

If this is your case consider using `/etc/X11/xorg.conf.d/00-keyboard.conf` (`man xorg.conf` DESCRIPTION for all available paths):

    Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbOptions" "grp:toggle"
    EndSection

    Section "InputClass"
            Identifier "Bluetooth Keyboard"
            MatchIsKeyboard "on"
            MatchProduct "Bluetooth 3.0 Keyboard"
            Option "XkbLayout" "us,ru"
            Option "XkbOptions" "grp:alt_shift_toggle,grp_led:caps"
    EndSection
