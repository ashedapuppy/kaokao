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

git submodule update --init --recursive

echo "installing kaomojis db to $install_db"
json2tsv &&
    mkdir -p "$install_db" &&
    cp kaomoji.tsv "$install_db"

echo "installing kaokao.desktop to $install_desktop"
mkdir -p "$install_desktop" && cp ./kaokao.desktop "$install_desktop"

echo "installing kaokao.sh to $install_bin"
mkdir -p "$install_bin" && cp ./kaokao.sh "$install_bin"

echo "done"
