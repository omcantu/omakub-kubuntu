#!/bin/bash

sudo apt install -y flatpak
sudo apt install -y plasma-discover-backend-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
