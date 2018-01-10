#!/bin/bash
if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi
if [ -z "${2}" ]; then
   WEB_URL="http://v2.channel40.com.au"
   #WEB_URL="http://channel40-web-dev.channel40.com.au:81"
else
   WEB_URL="${2}"
fi
echo "WEB_URL="$WEB_URL
docker run -it --rm -e WEB_URL=${WEB_URL} -v $PWD/tests:/home/robot-framework/tests -v $PWD/reports:/home/robot-framework-logs -v $PWD/resources:/home/robot-framework/resources -v $PWD/screenshots:/home/robot-framework/screenshots gennyproject/robot:${version} 
