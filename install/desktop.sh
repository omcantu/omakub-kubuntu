#!/bin/bash

# Run desktop installers
for installer in ~/.local/share/omakub/install/desktop/*.sh; do
	# If running KDE, skip scripts that are GNOME-specific (filename contains 'gnome')
	if [[ "${XDG_CURRENT_DESKTOP:-}" == *"KDE"* ]] && [[ "$(basename "$installer")" == *gnome* ]]; then
		echo "Skipping GNOME-specific installer: $installer"
		continue
	fi
	source "$installer"
done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
