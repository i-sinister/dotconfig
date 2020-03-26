#!/bin/bash

# dependencies:
# * tmuxinator
# * rofi

# bind following to the shortcut:
# bash -c "~/.config/bin/tmux_project_attach.sh"


tmuxinator list \
    | tail -n 1 \
    | xargs -n 1 \
    | rofi -dmenu -matching fuzzy -sort -p "projects"\
    | while read project;
do
    xfce4-terminal --maximize --hide-borders --hide-menubar --hide-toolbar -e "tmuxinator $project"
done;

exit 0
