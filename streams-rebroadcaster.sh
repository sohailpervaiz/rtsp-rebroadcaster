#!/bin/bash

source ~/rtsp-rebroadcaster/stream.conf

# Change to the directory where MediaMTX is located
chmod +x $MEDIAMTX_PATH


# Start MediaMTX
$MEDIAMTX_PATH &


# Wait for MediaMTX to start fully
sleep 3

# Start FFmpeg streams
for i in "${!STREAMS[@]}"; do
    ffmpeg -rtsp_transport tcp -i "${STREAMS[$i]}" $FFMPEG_OPTIONS -f rtsp "${RTSP_OUTPUT}$((i+1))" &
done