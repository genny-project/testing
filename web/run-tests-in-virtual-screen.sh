#!/bin/bash
rm /tmp/xvfb.auth && touch /tmp/xvfb.auth

x11vnc -storepasswd genny /tmp/vncpass

xvfb-run --listen-tcp --server-num 98 -f /tmp/xvfb.auth -s "-screen 0 1280x720x24 -ac" commands.sh

#results-parse.py /opt/robotframework/reports/output.xml ${SLACK_WEBHOOK}
