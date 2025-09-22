#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Pinta is a simple yet powerful image editor. See https://www.pinta-project.com/
if [ "$OS_NAME" = "Ubuntu" ]; then
  # FIXME: Get this out of snap
  sudo snap install pinta
else
  flatpak install flathub com.github.PintaProject.Pinta
fi
