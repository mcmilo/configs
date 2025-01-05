#!/bin/sh
intern=eDP
extern=HDMI-A-0

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$intern" --primary --output "$extern" --off
else
    xrandr --output "$intern" --primary --right-of "$extern" --auto
fi
