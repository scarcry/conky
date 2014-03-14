#!/bin/bash

res=$(xrandr | head -1 | awk '{print $8}')

if [ $res = "1366" ]; then
  conky -d -c ~/.conky/conky-sd.conf
else
  conky -d -c ~/.conky/conky.conf
fi
