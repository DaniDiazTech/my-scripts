#!/bin/bash

if grep -q "suspend cause: USER" <(pacmd info); then
  pacmd "suspend 0"
  pactl set-sink-mute 1 0
else
  pacmd "suspend 1"
  pactl set-sink-mute 1 1
fi

