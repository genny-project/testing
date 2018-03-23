#!/bin/bash


today=`date '+%Y_%m_%d__%H_%M_%S'`;

$(x11vnc -rfbport 4500 -rfbauth /tmp/vnc/pass -display :90 -forever -auth /tmp/vnc/xvfb.auth) &

<./stop ffmpeg -f x11grab -video_size 1920x1080 -i :90 -c:v libx264 -preset ultrafast -r 12 /opt/robotframework/reports/$today.mkv &

DISPLAY=":90" robot --outputDir /opt/robotframework/reports /opt/robotframework/tests

echo 'q' > stop