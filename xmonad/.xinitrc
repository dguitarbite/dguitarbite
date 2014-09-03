# set cursor
xsetroot -cursor_name left_ptr
# start xmonad
exec xmonad
# Initialize Trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 &
