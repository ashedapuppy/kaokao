#!/usr/bin/env sh
install_dir=$HOME/.local/share/kaomojis

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


json2tsv &&
    mkdir -p "$install_dir" &&
    cp kaomoji.tsv "$install_dir"
