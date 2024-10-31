#!/bin/bash
#

# Enable Touchpad Tapping
device_id=$(xinput list | grep 'Touchpad' | awk '{print $6}' | awk -F '=' '{print $NF}')
prop_id=$(xinput list-props $device_id | grep 'Tapping Enabled (' | sed 's/\([^0-9]*\)\(.*\)/\2/' | sed 's/\([^)]*\).*/\1/')
xinput set-prop $device_id $prop_id 1 &&

# Load Picom
picom --vsync -b &
