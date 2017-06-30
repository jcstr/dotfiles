exec compton -bc

udiskie -t &

$ sh ~/.fehbg &

if [ `xrandr | grep -c ' connected '` -eq 2 ]; then # dual-monitor
    if [ `xrandr | grep VGA-1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output LVDS-1 --auto --primary --output VGA-1 --auto --right-of LVDS-1
    fi
    if [ `xrandr | grep DVI-1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output LVDS-1 --auto --primary --output DVI-1 --auto --right-of LVDS-1
    fi
       
#    xsetroot -solid \#cccccc
else
    xrandr --output LVDS-1 --auto --primary --output VGA-1 --off --output DVI-1 --off
    
fi
