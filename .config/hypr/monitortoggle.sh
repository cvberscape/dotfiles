#!/bin/bash

# Check the current state of the HDMI-A-1 monitor
current_state=$(hyprctl monitors | grep "HDMI-A-1" | wc -l)

if [ $current_state -gt 0 ]; then
  # Monitor is currently on, so disable it
  hyprctl keyword monitor "HDMI-A-1, disable"
else
  # Monitor is currently off, so re-enable it
  hyprctl keyword monitor "HDMI-A-1, 2560x1440@75, 1920x-360, 1"
fi
