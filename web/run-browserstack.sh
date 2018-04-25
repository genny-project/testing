#!/bin/bash


if [ -z "${1}" ]; then
   echo "please supply a WEB_URL"
   exit 1
else
   WEB_URL="${1}"
fi

if [ -z "${2}" ]; then
   echo "please supply a BROWSERSTACK_USER"
   exit 1
else
   BROWSERSTACK_USER="${2}"
fi

if [ -z "${3}" ]; then
   echo "please supply a BROWSERSTACK_TOKEN"
   exit 1
else
   BROWSERSTACK_TOKEN="${3}"
fi

echo "testing ${WEB_URL}"

docker run --rm -d --name robot-dev  \
  -e WEB_URL=$WEB_URL \
  -e BROWSER=chrome  \
  -e BROWSERSTACK_USER=${BROWSERSTACK_USER}  \
  -e BROWSERSTACK_TOKEN=${BROWSERSTACK_TOKEN}  \
  -p 4500:4500 \
  -v $PWD/resources:/opt/robotframework/tests/resources  \
  -v $PWD/tests:/opt/robotframework/tests  \
  -v $PWD/reports:/opt/robotframework/reports  \
  -v /tmp/vnc:/tmp/vnc  \
  gennyproject/robot:browserstack

docker logs -f robot-dev
