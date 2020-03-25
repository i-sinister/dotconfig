#!/bin/bash

# dependencies:
# * tmuxinator
# * rofi

# bind following to the shortcut:
# bash -c "~/bin/attach_tmux_project.sh"


tmuxinator list \
    | tail -n 1 \
    | xargs -n 1 \
    | rofi -dmenu \
    | while read project;
do
    xfce4-terminal --maximize --hide-borders --hide-menubar --hide-toolbar -e "tmuxinator $project"
done;

exit 0
