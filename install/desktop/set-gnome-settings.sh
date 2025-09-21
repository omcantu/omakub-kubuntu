#!/bin/bash
# Source shared env helpers if available (idempotent)
if [[ -f "$HOME/.local/share/omakub/lib/env.sh" ]]; then
	source "$HOME/.local/share/omakub/lib/env.sh"
else
	source "$(dirname "$0")/../../install/lib/env.sh" || true
fi

# Center new windows in the middle of the screen
if command -v run_kwriteconfig >/dev/null 2>&1; then
	run_kwriteconfig --file kwinrc --group Windows --key Placement Centered
elif [[ -n "${KWRC:-}" ]]; then
	$KWRC --file kwinrc --group Windows --key Placement Centered
else
	echo "Warning: kwriteconfig not available; skipping window placement setting"
fi

# Set Cascadia Mono as the default monospace font
if command -v run_kwriteconfig >/dev/null 2>&1; then
	run_kwriteconfig --file kdeglobals --group General --key fixed Font "CaskaydiaMono Nerd Font,10,-1,5,50,0,0,0,0,0"
elif [[ -n "${KWRC:-}" ]]; then
	$KWRC --file kdeglobals --group General --key fixed Font "CaskaydiaMono Nerd Font,10,-1,5,50,0,0,0,0,0"
else
	echo "Warning: kwriteconfig not available; skipping default monospace font setting"
fi

# Reveal week numbers in the KDE calendar (Digital Clock widget)
if command -v run_kwriteconfig >/dev/null 2>&1; then
	run_kwriteconfig --file plasmashellrc --group "[Containments][1][Applets][2][Configuration][General]" --key showWeekNumbers true
elif [[ -n "${KWRC:-}" ]]; then
	$KWRC --file plasmashellrc --group "[Containments][1][Applets][2][Configuration][General]" --key showWeekNumbers true
else
	echo "Warning: kwriteconfig not available; skipping week numbers setting"
fi
