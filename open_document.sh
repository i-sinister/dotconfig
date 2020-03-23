#!/bin/bash

# dependencies:
# * ag
# * rofi
# * exo-open

# bind following to the shortcut:
# bash -c "~/bin/open_document.sh"

if [ -n "$1" ]
then
    cd $1
fi

ag --hidden --path-to-ignore ~/.ignore -g "" \
	| rofi -dmenu -matching fuzzy -sort \
	| while read doc;
do
	exo-open "$doc"
done;

exit 0
