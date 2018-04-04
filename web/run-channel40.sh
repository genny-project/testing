#!/bin/bash


if [ -z "${1}" ]; then
   echo "please supply a WEB_URL"
   exit 1
else
   WEB_URL="${1}"
fi

echo "testing ${WEB_URL}"

docker run --rm -d --name robot-dev  \
  -e WEB_URL=$WEB_URL \
  -e BROWSER=chrome  \
  -e TEST_DIR=channel40 \
  -p 4500:4500 \
  -v $PWD/resources:/opt/robotframework/tests/resources  \
  -v $PWD/tests:/opt/robotframework/tests  \
  -v $PWD/reports:/opt/robotframework/reports  \
  -v /tmp/vnc:/tmp/vnc  \
  gennyproject/robot:latest

docker logs -f robot-dev
