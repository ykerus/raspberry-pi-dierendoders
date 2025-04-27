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

# Wait until after `start_hour`
start_hour=14
while true; do
  current_hour=$(date +%H)
  if [[ $current_hour -ge start_hour ]]; then
    break
  fi
  echo "Current time is before $start_hour:00. Waiting..."
  sleep 60  # Check again in 1 minute
done

# Wait to next `start_minute` to turn on video
start_minute=10
current_time=$(date +%s)
next_start_time=$(( (current_time / (start_minute * 60) + 1) * (start_minute * 60) ))
sleep_duration=$((next_start_time - current_time))
echo "sleep_duration=$sleep_duration"
sleep $sleep_duration

# Start video on loop in fullscreen
cvlc \
    --loop \
    --fullscreen \
    --no-video-deco \
    --aspect-ratio=16:9 \
    ~/Videos/film.mp4
