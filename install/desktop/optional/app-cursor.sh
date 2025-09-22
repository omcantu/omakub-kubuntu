#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

cd /tmp
curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
sudo mv cursor.appimage /opt/cursor.appimage
sudo chmod +x /opt/cursor.appimage

if [ "$OS_NAME" = "Ubuntu" ]; then
	sudo $PKG_MGR install -y fuse3
	sudo $PKG_MGR install -y libfuse2t64
	DESKTOP_FILE="/usr/share/applications/cursor.desktop"

	sudo bash -c "cat > $DESKTOP_FILE" <<EOL
	[Desktop Entry]
	Name=Cursor
	Comment=AI-powered code editor
	Exec=/opt/cursor.appimage --no-sandbox
	Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
	Type=Application
	Categories=Development;IDE;
	EOL
else
	mkdir -p ~/.local/bin
	mv cursor.AppImage ~/.local/bin/cursor
	DESKTOP_FILE="~/.local/share/applications/Cursor.desktop"
sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Version=1.0
Name=Cursor
StartupWMClass=cursor
Comment=AI powered code editor
Exec=/home/$USER/.local/bin/cursor.AppImage
Terminal=false
Type=Application
Keywords=Cursor;cursor
Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
Categories=Development;IDE;
StartupNotify=false
EOL
fi

cd -