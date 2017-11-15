#!/bin/bash

echo "Starting X Virtual Framebuffer"
Xvfb :0 &

export DISPLAY=:0

cd /home/
pybot --outputdir $RFLOGS robot-framework

