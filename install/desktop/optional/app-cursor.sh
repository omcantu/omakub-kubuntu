#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh



if [ "$OS_NAME" = "Ubuntu" ]; then
	cd /tmp
	curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
	sudo mv cursor.appimage /opt/cursor.appimage
	sudo chmod +x /opt/cursor.appimage
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
	cd /tmp
	CURSOR_LINK=$(curl -s -X POST -H "Content-Type: application/json" -d '{"platform": 5}' "https://www.cursor.com/api/dashboard/get-download-link" | jq -r '.cachedDownloadLink')
	wget -O cursor.AppImage $CURSOR_LINK
	chmod +x cursor.AppImage
	mkdir -p ~/.local/bin
	mv cursor.AppImage ~/.local/bin/cursor

	# Configure Cursor
	mkdir -p ~/.config/Cursor/User
	cp ~/.local/share/omakub/configs/cursor.json ~/.config/Cursor/User/settings.json


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