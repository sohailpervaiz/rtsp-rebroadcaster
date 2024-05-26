# rtsp-rebroadcaster
This project facilitates the transcoding and rebroadcasting of live RTSP video streams from one format to another on the Raspberry Pi. It is particularly useful when you need to convert an H.265 (HEVC) live stream to H.264 (AVC), as many services and devices do not yet support the H.265 codec.

## Overview

The RTSP Stream Transcoder is designed to receive an RTSP video stream, transcode it from H.265 to H.264 format using hardware acceleration on the Raspberry Pi, and rebroadcast the transcoded H.264 stream over RTSP. This allows you to take advantage of the improved compression efficiency of H.265 for source video capture and distribution, while ensuring compatibility with existing services and devices that only support H.264.

## Features

- Accepts RTSP H.265 (HEVC) video streams as input
- Transcodes the H.265 stream to H.264 (AVC) format using hardware acceleration on the Raspberry Pi
- Rebroadcasts the transcoded H.264 stream over RTSP
- Configurable transcoding parameters (bitrate, resolution, etc.)
- Lightweight and efficient, optimized for resource-constrained Raspberry Pi devices


## Installation and Configuration

## Prerequisites

- Ubuntu or Debian-based system

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/rtsp-rebroadcaster.git
    cd rtsp-rebroadcaster
    ```

2. **Run the installation script**:
    ```sh
    ./install.sh
    ```

## Configuration

The `mediamtx.conf` file contains the following configuration options:
- `MEDIAMTX_PATH`: Path to the MediaMTX binary.
- `STREAMS`: Array of RTSP stream URLs.
- `FFMPEG_OPTIONS`: Options to pass to FFmpeg.
- `RTSP_OUTPUT`: Base RTSP URL for output streams.

Edit this file to match your setup before starting the service.

## Usage

The service will automatically start on system boot and can be managed using systemd:
- Start the service: `sudo systemctl start rtsp-rebroadcaster.service`
- Stop the service: `sudo systemctl stop rtsp-rebroadcaster.service`
- Check the status: `sudo systemctl status rtsp-rebroadcaster.service`

The RTSP Stream Transcoder is designed to be easy to use and integrate into your existing video streaming infrastructure on the Raspberry Pi. Simply provide the input RTSP H.265 stream URL, configure any desired transcoding parameters, and the tool will handle the rest. 

## Contributing

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.
