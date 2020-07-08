grep -e 'bindsym \$mod' ~/.config/i3/config \
    | cut -d" " -f2- \
    | sort \
    | rofi -dmenu -matching normal -p "shortcuts"
