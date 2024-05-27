#!/bin/bash

source ~/rtsp-rebroadcaster/stream.conf

# Change directory to the extracted folder
cd ~/rtsp-rebroadcaster

# Check if the logs directory exists, if not, create it
if [ ! -d "./logs" ]; then
    mkdir -p ./logs
fi

# Unzip mediamtx_v1.8.2_linux_armv7.tar.gz
tar -xzvf ~/mediamtx/mediamtx_v1.8.2_linux_armv7.tar.gz -C .

# Execute Permisions to MediaMTX
chmod +x ./mediamtx

# Run mediamtx and redirect output to a log file
./mediamtx > ./logs/mediamtx.log &


# Start FFmpeg streams
for i in "${!STREAMS[@]}"; do
    ffmpeg -rtsp_transport tcp -i "${STREAMS[$i]}" $FFMPEG_OPTIONS -f rtsp "${RTSP_OUTPUT}$((i+1))" > ./logs/"${RTSP_LOG}$((i+1)).log" 2>&1 &
done

# Keep the script running indefinitely
while true; do
    sleep 1
done