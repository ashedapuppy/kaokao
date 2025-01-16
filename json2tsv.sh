#!/bin/bash
# short jq script to conver the kaomoji-dataset json file to tsv format

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
