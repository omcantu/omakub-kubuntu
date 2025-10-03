#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omakub installation failed! You can retry by running: source ~/.local/share/omakub/install.sh"' ERR

# Load environment helpers
source ~/.local/share/omakub/install/lib/env.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakub/install/first-run-choices.sh
source ~/.local/share/omakub/install/identification.sh

echo "Installing desktop tools and terminal tools"
# Ensure computer doesn't go to sleep or lock while installing (KDE/Plasma)
if [[ -n "$KWRC" ]]; then
  $KWRC --file kscreenlockerrc --group Daemon --key Autolock false
  $KWRC --file powermanagementprofilesrc --group AC --key idleTime 0
else
  echo "Warning: kwriteconfig5/6 not found; skipping Autolock/idleTime change"


  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/omakub/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/omakub/install/desktop.sh

  # Revert to normal idle and lock settings (KDE/Plasma)
  if [[ -n "$KWRC" ]]; then
    $KWRC --file kscreenlockerrc --group Daemon --key Autolock true
    $KWRC --file powermanagementprofilesrc --group AC --key idleTime 300
  else
    echo "Warning: kwriteconfig5/6 not found; skipping revert of Autolock/idleTime"
  fi
  echo "Omakubtu installation complete!"
