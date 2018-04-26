#!/bin/bash

if [ -z "$TEST_DIR" ]; then
    export TEST_DIR=genny
fi

echo "testing $TEST_DIR"


if [ -z "$TEST_DIR" ]; then
    export TEST_DIR=genny
fi



if [ -z "$BROWSERSTACK_USER" ]; then
  mkdir /tmp/vnc
  rm /tmp/vnc/xvfb.auth && touch /tmp/vnc/xvfb.auth
  x11vnc -storepasswd genny /tmp/vnc/pass
  xvfb-run --listen-tcp --server-num 90 -f /tmp/vnc/xvfb.auth -s "-screen 0 1920x1080x24 -ac" commands.sh
else
  export BROWSER= ${BROWSER:="Edge"}
  export BROWSER_VERSION= ${BROWSER_VERSION:="16.0"}
  export OS= ${OS:="Windows"}
  export OS_VERSION= ${OS_VERSION:="10"}

  BrowserStackLocal --force-local --daemon start --key ${BROWSERSTACK_TOKEN} 
  robot --outputDir /opt/robotframework/reports /opt/robotframework/tests/Smoke_Test/$TEST_DIR
    BrowserStackLocal --daemon stop

fi

#results-parse.py /opt/robotframework/reports/output.xml ${SLACK_WEBHOOK}
