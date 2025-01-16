#!/usr/bin/env sh
install_db=$HOME/.local/share/kaomojis
install_desktop=$HOME/.local/share/applications
install_bin=$HOME/.local/bin/

json2tsv() {
    json_file=./emoticon_kaomoji_dataset/emoticon_dict.json

    if ! jq empty "$json_file" 2>/dev/null; then
        echo "Invalid JSON file: $json_file"
        exit 1
    fi

    jq -r 'to_entries[] |
  [
    .key,
    (.value.original_tags + .value.new_tags | unique | join(", "))
  ] | @tsv' "$json_file" > kaomoji.tsv
}


# translate kaomoji db from json to tsv,
# then install it to ~/.local/share/kaomojis/
json2tsv &&
    mkdir -p "$install_db" &&
    cp kaomoji.tsv "$install_db"

# install kaokao.desktop
cp ./kaokao.desktop "$install_desktop"

# install kaokao.sh
cp ./kaokao.sh "$install_bin"
