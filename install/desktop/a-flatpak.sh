#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

sudo $PKG_MGR install -y flatpak
sudo $PKG_MGR install -y plasma-discover-backend-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
