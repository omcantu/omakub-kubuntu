#!/bin/bash

envsubst < ~/.local/share/omakub/configs/xcompose > ~/.XCompose
ibus restart
kwriteconfig6 --file ~/.config/kxkbrc --group Layout --key Options "compose:caps"
