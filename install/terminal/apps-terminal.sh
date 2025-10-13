#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo $PKG_MGR install -y fzf ripgrep bat eza zoxide plocate apache2-utils fd-find tealdeer
else
  sudo $PKG_MGR install -y fzf ripgrep bat zoxide plocate httpd-tools fd-find tldr
  #manual install for eza on fedora
  cd /tmp
  EZA_VERSION=$(curl -s "https://api.github.com/repos/eza-community/eza/releases/latest" | grep -Po 'tag_name": "v\K[^"]*')
  curl -sLo eza.tar.gz "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/eza_x86_64-unknown-linux-gnu.tar.gz"
  tar -xf eza.tar.gz
  sudo install eza /usr/local/bin
  rm eza.tar.gz eza
  cd -

fi

