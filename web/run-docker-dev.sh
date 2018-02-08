#!/bin/bash
PWD=`pwd`
if [ -z "${1}" ]; then
   WEB_URL="http://v2.channel40.com.au"
else
   WEB_URL="${1}"
fi
if [ -z "${2}" ]; then
   KEYCLOAKURL="http://localhost:8180/auth/admin"
else
   KEYCLOAKURL="${2}"
fi

echo "testing ${WEB_URL}"

docker run --rm -d --name robot-dev  \
  -e WEB_URL=$WEB_URL \
  -e KEYCLOAK_URL=$KEYCLOAK_URL \
  -e BROWSER=chrome  \
  -v $PWD/resources:/opt/robotframework/tests/resources  \
  -v $PWD/tests:/opt/robotframework/tests  \
  -v $PWD/reports:/opt/robotframework/reports  \
  gennyproject/robot:latest
  
docker logs -f robot-dev
