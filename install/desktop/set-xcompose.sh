#!/bin/bash

# Source shared env helpers if available (idempotent)
if [[ -f "$HOME/.local/share/omakub/lib/env.sh" ]]; then
	source "$HOME/.local/share/omakub/lib/env.sh"
else
	source "$(dirname "$0")/../../install/lib/env.sh" || true
fi

envsubst < ~/.local/share/omakub/configs/xcompose > ~/.XCompose
ibus restart
if command -v run_kwriteconfig >/dev/null 2>&1; then
	run_kwriteconfig --file ~/.config/kxkbrc --group Layout --key Options "compose:caps"
elif [[ -n "${KWRC:-}" ]]; then
	$KWRC --file ~/.config/kxkbrc --group Layout --key Options "compose:caps"
else
	echo "Warning: kwriteconfig not available; skipping xcompose option"
fi
