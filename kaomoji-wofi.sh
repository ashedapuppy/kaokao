#!/usr/bin/env sh

###################################################################################
# TODO: figure out how to parse large tsv file with kaomoji into the right wofi   #
# script, should be able to open the very large dataset and let user pick amongst #
# the kaomoji, copying the selection to clipboard (wcopy)                         #
#                                                                                 #
# Typing the selection directly (wtype) is possible on some wayland compositors,  #
# but not kwin since it doesn't seem to enable virtual keyboards.                 #
# for now, we will only copy the selection to clipboard and let the user sort     #
# the rest.                                                                       #
###################################################################################
cat emoticon.tsv | wofi --show dmenu -i | cut -f 1 | wl-copy
