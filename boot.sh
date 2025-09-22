#!/bin/bash

set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Load environment helpers
source ~/.local/share/omakub/install/lib/env.sh

sudo $PKG_MGR update >/dev/null
sudo $PKG_MGR install -y git >/dev/null

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/omcantu/omakub-kubuntu.git ~/.local/share/omakub >/dev/null


echo "Installation starting..."
source ~/.local/share/omakub/install.sh
