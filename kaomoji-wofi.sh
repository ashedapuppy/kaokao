#!/usr/bin/env sh

# simple script - allow selecting from kaomoji.tsv
# and copies selection to system cliboard
wofi --dmenu -i < kaomoji.tsv | cut -f 1 | wl-copy
