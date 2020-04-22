#!/bin/bash

# dependencies:
# * ag
# * rofi
# * exo-open

# bind following to the shortcut:
# bash -c "~/.config/bin/document_open.sh"

folders=
for folder in "$@"; do
    folders="$folders -Q $folder"
done
if [ -z "$folders" ]
then
    folders=~/Documents
    folders="-Q ${folders}"
fi

ag --hidden --path-to-ignore ~/.ignore -g "" \
    $folders \
	| rofi -dmenu -matching fuzzy -sort -p "documents" \
	| while read doc;
do
	exo-open "$doc"
done;

exit 0
