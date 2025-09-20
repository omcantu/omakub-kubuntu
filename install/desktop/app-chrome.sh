#!/bin/bash

# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
# For KDE Plasma 6, use the following to set the default browser:
plasma-settings set default-browser google-chrome.desktop
cd -
