#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Needed for all installers
sudo $PKG_MGR update -y
sudo $PKG_MGR upgrade -y
sudo $PKG_MGR install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
