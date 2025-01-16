#!/usr/bin/env sh

# simple script - allow selecting from kaomoji.tsv
# and copies selection to system cliboard
kaomojis=$HOME/.local/share/kaomojis/kaomoji.tsv
rofi=""

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    rofi="wofi --dmenu -i"
else
    rofi="rofi -dmenu -i"
fi

if [ -e $kaomojis ]; then
    $rofi < "$kaomojis" | cut -f 1 | wl-copy
else
    echo "kaomoji.tsv not found, try running install.sh"
    exit 1
fi


# TODO: check if running X11 or wayland, use rofi or wofi
