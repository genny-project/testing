#!/bin/bash

if [ -z "$TEST_DIR" ]; then
    export TEST_DIR=genny
fi

echo "testing $TEST_DIR"

mkdir /tmp/vnc

rm /tmp/vnc/xvfb.auth && touch /tmp/vnc/xvfb.auth

x11vnc -storepasswd genny /tmp/vnc/pass

xvfb-run --listen-tcp --server-num 90 -f /tmp/vnc/xvfb.auth -s "-screen 0 1920x1080x24 -ac" commands.sh


#results-parse.py /opt/robotframework/reports/output.xml ${SLACK_WEBHOOK}
