#!/bin/bash
if [ -z "${1}" ]; then
   url="http://alyson.genny.life"
else
   url="${1}"
fi
echo "reports="$PWD/reports
docker run --rm -e WEB_URL=${url} -e BROWSER=chrome -v $PWD/reports:/opt/robotframework/reports -v $PWD/screenshots:/home/robotframework/screenshots gennyproject/robot:latest
