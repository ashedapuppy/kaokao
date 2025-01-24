#!/usr/bin/env sh

# simple script - allow selecting from kaomoji.tsv
# and copies selection to system cliboard
kaomojis=$HOME/.local/share/kaomojis/kaomoji.tsv

exists () {
  type "$1" >/dev/null 2>/dev/null
}

if [ -e $kaomojis ]; then
  # if on wayland (my computer) -- use wofi and copy to clipboard
  if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    wofi --dmenu -i <"$kaomojis" | cut -f 1 | wl-copy

  # otherwise, use splatmoji and type
  else
    exists splatmoji && splatmoji --disable-emoji-db --disable-emoticon-db copypaste "$kaomojis"
  fi

# someone forgot to run the install script
else
  echo "kaomoji.tsv not found, try running install.sh"
  exit 1
fi
