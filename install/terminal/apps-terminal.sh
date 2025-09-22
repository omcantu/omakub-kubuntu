#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo $PKG_MGR install -y fzf ripgrep bat eza zoxide plocate apache2-utils fd-find tldr
else
  sudo $PKG_MGR install -y fzf ripgrep bat eza zoxide plocate httpd-tools fd-find tldr
fi

