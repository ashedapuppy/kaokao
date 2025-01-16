#!/usr/bin/env sh

# simple script - allow selecting from kaomoji.tsv
# and copies selection to system cliboard
kaomojis=$HOME/.local/share/kaomojis/kaomoji.tsv

if [ -e $kaomojis ]; then
    wofi --dmenu -i < "$kaomojis" | cut -f 1 | wl-copy
else
    echo "kaomoji.tsv not found, try running install.sh"
    exit 1
fi

# TODO: check if running X11 or wayland, use rofi or wofi
