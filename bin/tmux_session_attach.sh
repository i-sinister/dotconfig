#!/bin/bash

# dependencies:
# * tmux
# * rofi

# bind following to the shortcut:
# bash -c "~/.config/bin/tmux_session_attach.sh"

sessions=($(tmux list-sessions | sed 's/\([^:]\+\).*/\1/' | sort))
if [ -z "$sessions" ]
then
    sessions=new_session
fi
printf "%s\n" "${sessions[@]}" \
    | rofi -dmenu -matching fuzzy -p "sessions"\
    | while read session;
do
   xfce4-terminal --hide-menubar --hide-scrollbar -e "tmux new-session -A -s $session"
done;

exit 0
