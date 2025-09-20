#!/bin/bash
# Center new windows in the middle of the screen
kwriteconfig6 --file kwinrc --group Windows --key Placement Centered

# Set Cascadia Mono as the default monospace font
kwriteconfig6 --file kdeglobals --group General --key fixed Font "CaskaydiaMono Nerd Font,10,-1,5,50,0,0,0,0,0"

# Reveal week numbers in the KDE calendar (Digital Clock widget)
kwriteconfig6 --file plasmashellrc --group [Containments][1][Applets][2][Configuration][General] --key showWeekNumbers true
