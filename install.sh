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
    tar -xvzf "$(basename "$MEDIAMTX_TAR_URL")"
}

# Main script
install_ffmpeg
download_and_extract_mediamtx

echo "Installation complete. The RTSP Rebroadcaster service has been started and will start on boot. Please reboot your computer to apply the changes."
