#!/bin/bash
if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi
if [ -z "${2}" ]; then
   WEB_URL="http://docker-web.channel40.com.au"
   #WEB_URL="http://channel40-web-dev.channel40.com.au:81"
else
   WEB_URL="${2}"
fi
echo "WEB_URL="$WEB_URL
docker run -it --rm -e WEB_URL=${WEB_URL} channel40/testing:${version} 
