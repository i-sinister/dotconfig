#!/bin/bash

# dependencies:
# * xfconf-query
# * rofi

# bind following to the shortcut:
# bash -c "~/.config/bin/xfce_commands.sh"

xfconf-query -l -c xfce4-keyboard-shortcuts -v -a \
	| sed '
		/^\(override\|\/providers\)/d;
		/\/startup-notify/d
		s/<Primary>/<Ctrl>/g;
		s/\/xfwm4\/\(default\|custom\)\/\([^ ]\+\) \+\(.*$\)/\2 | @\3/g;
		s/\/commands\/\(default\|custom\)\/\([^ ]\+\) \+\(.*$\)/\2 | \3/g;' \
	| sort | uniq \
	| rofi -dmenu -matching fuzzy -sort -fullscreen -p 'commands' \
	| sed 's/[^|]\+| //; /^@/d' \
	| bash
	# uncommend following line for debugging
	# | while read command; do xfce4-terminal --hide-borders --hold --hide-menubar --hide-toolbar -e "echo iii${command}iii"; done;

exit 0
