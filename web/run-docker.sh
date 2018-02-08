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
echo "WEB_URL="$WEB_URL
docker run -e WEB_URL=$WEB_URL -e BROWSER=chrome -e -v $PWD/reports:/opt/robotframework/reports -v $PWD/screenshots:/home/robotframework/screenshots gennyproject/robot:latest
