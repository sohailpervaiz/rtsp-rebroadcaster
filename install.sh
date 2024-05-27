#!/bin/bash

# Variables
PROJECT_DIR="$HOME/rtsp-rebroadcaster"
MEDIAMTX_DIR="$HOME/mediamtx"
MEDIAMTX_TAR_URL="https://github.com/bluenviron/mediamtx/releases/download/v1.8.2/mediamtx_v1.8.2_linux_armv7.tar.gz"
SYSTEMD_SERVICE_FILE="/etc/systemd/system/rtsp-rebroadcaster.service"

# Functions
install_ffmpeg() {
    sudo apt-get update
    sudo apt-get install -y ffmpeg
}

download_and_extract_mediamtx() {
    mkdir -p "$MEDIAMTX_DIR"
    cd "$MEDIAMTX_DIR"
    wget "$MEDIAMTX_TAR_URL"
}

make_the_script_executable() {
    chmod +x "$PROJECT_DIR/streams-rebroadcaster.sh"
    # Ensure the correct ownership
    sudo chown $USER:$USER "$PROJECT_DIR/streams-rebroadcaster.sh"
    sudo chown -R $USER:$USER "$PROJECT_DIR"
}

create_systemd_service() {
    sudo tee "$SYSTEMD_SERVICE_FILE" > /dev/null <<EOF
[Unit]
Description=RTSP Rebroadcaster with MediaMTX and FFmpeg
After=network.target

[Service]
ExecStart=$PROJECT_DIR/streams-rebroadcaster.sh
Restart=always
User=$USER
Group=$(id -gn $USER)
Environment=DISPLAY=:0
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF
}

enable_and_start_service() {
    sudo systemctl daemon-reload
    sudo systemctl enable rtsp-rebroadcaster.service
    sudo systemctl start rtsp-rebroadcaster.service
}

# Main script
install_ffmpeg
download_and_extract_mediamtx
make_the_script_executable
create_systemd_service
enable_and_start_service

# Output
echo "Installation complete. The RTSP Rebroadcaster service has been started and will start on boot. Please reboot your computer to apply the changes."
