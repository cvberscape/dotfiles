#!/bin/sh

killall pipewire
killall pipewire-pulse
killall wireplumber

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
sleep 10
/usr/bin/wireplumber &
disown
