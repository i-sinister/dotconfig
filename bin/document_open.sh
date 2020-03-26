#!/bin/bash

# dependencies:
# * ag
# * rofi
# * exo-open

# bind following to the shortcut:
# bash -c "~/.config/bin/document_open.sh"

folder=${1:-~/Documents}

ag --hidden --path-to-ignore ~/.ignore -g "" \
    -Q $folder \
	| rofi -dmenu -matching fuzzy -sort -p "documents" \
	| while read doc;
do
	exo-open "$doc"
done;

exit 0
