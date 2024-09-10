#!/bin/bash

# Credit to dfroger

# This is script is launch by the editor/IDE (neovim, vscode...)

# Slugify
  # Transliterate everything to ASCII
  # Strip out apostrophes
  # Anything that's not a letter or number to a dash
  # Strip leading & trailing dashes
  # Everything to lowercase
  # Found here: https://duncanlock.net/blog/2021/06/15/good-simple-bash-slugify-function/
function slugify() {
  iconv -t ascii//TRANSLIT \
  | tr -d "'" \
  | sed -E 's/[^a-zA-Z0-9]+/-/g' \
  | sed -E 's/^-+|-+$//g' \
  | tr "[:upper:]" "[:lower:]"
}

docker run -i --rm \
    --name lsp-$(basename $PWD | slugify) \
    -v "$PWD:$PWD" \
    -w $PWD \
    py -v
