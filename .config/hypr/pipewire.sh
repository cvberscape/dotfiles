#!/bin/sh
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
sleep 10
/usr/bin/wireplumber &
disown
