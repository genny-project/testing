#!/bin/bash

today=`date '+%Y_%m_%d__%H_%M_%S'`;

$(x11vnc -rfbport 4500 -rfbauth /tmp/vnc/pass -display :90 -forever -auth /tmp/vnc/xvfb.auth) > /dev/null &



if [[ -z "${WAIT_FOR_IT}" ]]; then
  echo "not waiting"
else
  echo "Waiting 30s"
  echo $TEST_DIR
  sleep 30s
fi


ffmpeg -f x11grab -video_size 1920x1080 -i :90 -c:v libx264 -preset ultrafast -r 12 /opt/robotframework/reports/$today.mkv > /dev/null &

DISPLAY=":90" robot --outputDir /opt/robotframework/reports /opt/robotframework/tests/Smoke_Test/
