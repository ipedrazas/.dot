EXTERNAL=`xrandr|grep VGA`
if [ "$EXTERNAL" != "" ]; then
    xrandr --output VGA1 --primary
fi
