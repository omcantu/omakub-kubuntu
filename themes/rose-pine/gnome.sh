#!/bin/bash

OMAKUB_THEME_COLOR="red"
OMAKUB_THEME_BACKGROUND="rose-pine/background.jpg"
source $OMAKUB_PATH/themes/set-gnome-theme.sh
if command -v gsettings >/dev/null 2>&1 && [[ "${XDG_CURRENT_DESKTOP:-}" == *"GNOME"* ]]; then
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi
