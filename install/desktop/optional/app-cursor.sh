#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh



if [ "$OS_NAME" = "Ubuntu" ]; then
	cd /tmp
	curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
	sudo mv cursor.appimage /opt/cursor.appimage
	sudo chmod +x /opt/cursor.appimage
	sudo $PKG_MGR install -y fuse3
	sudo $PKG_MGR install -y libfuse2t64
sudo tee /usr/share/applications/cursor.desktop > /dev/null <<EOL
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
	mkdir -p $HOME/.local/bin
	mv cursor.AppImage $HOME/.local/bin/cursor

	# Configure Cursor
	mkdir -p $HOME/.config/Cursor/User
	cp $HOME/.local/share/omakub/configs/cursor.json $HOME/.config/Cursor/User/settings.json


	mkdir -p $HOME/.local/bin
	mv cursor.AppImage $HOME/.local/bin/cursor
	DESKTOP_FILE="$HOME/.local/share/applications/Cursor.desktop"

	sudo tee "$DESKTOP_FILE" > /dev/null <<EOL
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