#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omakub installation failed! You can retry by running: source ~/.local/share/omakub/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakub/install/first-run-choices.sh
source ~/.local/share/omakub/install/identification.sh

# Desktop software and tweaks will only be installed if we're running KDE
if [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
  echo "Installing desktop tools and terminal tools"
  # Ensure computer doesn't go to sleep or lock while installing (KDE/Plasma)
  kwriteconfig5 --file kscreenlockerrc --group Daemon --key Autolock false
  kwriteconfig5 --file powermanagementprofilesrc --group AC --key idleTime 0


  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/omakub/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/omakub/install/desktop.sh

  # Revert to normal idle and lock settings (KDE/Plasma)
  kwriteconfig5 --file kscreenlockerrc --group Daemon --key Autolock true
  kwriteconfig5 --file powermanagementprofilesrc --group AC --key idleTime 300

else
  echo "Only installing terminal tools..."
  source ~/.local/share/omakub/install/terminal.sh
fi
