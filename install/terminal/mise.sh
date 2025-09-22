#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  sudo $PKG_MGR update -y && sudo $PKG_MGR install -y gpg wget curl
  sudo install -dm 755 /etc/apt/keyrings
  wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  sudo $PKG_MGR update
  sudo $PKG_MGR install -y mise
else
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  sudo $PKG_MGR install -y gpg wget curl

  # Add mise repository for Fedora
  sudo $PKG_MGR config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo --overwrite
  sudo rpm --import https://mise.jdx.dev/gpg-key.pub

  # Install mise
  sudo $PKG_MGR install -y mise
fi