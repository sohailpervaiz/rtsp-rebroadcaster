#!/bin/bash

source ./stream.conf

# Change to the directory where MediaMTX is located
cd $MEDIAMTX_PATH

# Start MediaMTX
./mediamtx &

# Start FFmpeg streams
for i in "${!STREAMS[@]}"; do
    ffmpeg -rtsp_transport tcp -i "${STREAMS[$i]}" $FFMPEG_OPTIONS -f rtsp "${RTSP_OUTPUT}$((i+1))" &
done
