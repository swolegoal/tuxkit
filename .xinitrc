xmodmap ~/.Xmodmap

xrdb ~/.Xresources
LC_ALL=en_US.utf8
LANG=en_US.utf8

#xset -b # Disable the system bell
#xrandr --dpi 96 &
#(conky | while read LINE; do xsetroot -name "$LINE"; done) &

nitrogen --restore
autocutsel &

exec i3
