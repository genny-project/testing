#!/bin/bash

xvfb-run --server-args="-screen 0 1920x1080x24 -ac" robot --outputDir /opt/robotframework/reports /opt/robotframework/tests

results-parse.py /opt/robotframework/reports/output.xml ${SLACK_WEBHOOK}
