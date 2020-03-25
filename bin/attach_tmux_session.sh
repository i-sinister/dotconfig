#!/bin/bash

# dependencies:
# * tmux
# * rofi

# bind following to the shortcut:
# bash -c "~/bin/attach_tmux_session.sh"

tmux list-sessions \
    | sed 's/\([^:]\+\).*/\1/' \
    | rofi -dmenu \
    | while read session;
do
    xfce4-terminal --maximize --hide-borders --hide-menubar --hide-toolbar -e "tmux a -t $session"
done;

exit 0
