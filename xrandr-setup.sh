VGA=`xrandr|grep "VGA1 connected"`
if [ "$VGA" != "" ]; then
    echo "Activating VGA output..."
    xrandr --output VGA1 --primary
fi
HDMI=`xrandr|grep "HDMI1 connected"`
if [ "$HDMI" != "" ]; then
    echo "Activating HDMI output..."
    xrandr --output HDMI1 --primary
fi
