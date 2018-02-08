#!/bin/bash
PWD=`pwd`
if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi
if [ -z "${2}" ]; then
   WEB_URL="http://v2.channel40.com.au"
else
   WEB_URL="${2}"
fi

echo "testing ${WEB_URL}"

docker run --rm -d --name robot-dev  \
  -e WEB_URL=$WEB_URL \
  -e BROWSER=chrome  \
  -v $PWD/resources:/opt/robotframework/tests/resources  \
  -v $PWD/tests:/opt/robotframework/tests  \
  -v $PWD/reports:/opt/robotframework/reports  \
  gennyproject/robot:latest
docker logs -f robot-dev
