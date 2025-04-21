#!/bin/bash

# Toegevoegd op 2025-04-21 door Yke voor Dierendoders expositie
# Als dit bestand wordt gerund, dan wordt een gegeven video op loop afgespeeld

# Wait for the monitor to be ready
sleep 2
while true; do
    if xrandr | grep " connected" > /dev/null; then
        # Wait a bit more to really make sure it's ready
        sleep 2
        break
    fi
    sleep 1
done

# Start video on loop in fullscreen
cvlc \
    --loop \
    --fullscreen \
    --no-video-deco \
    --aspect-ratio=16:9 \
    ~/Videos/film.mp4
