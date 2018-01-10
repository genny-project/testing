#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi

docker push genny-project/robot-testing:"${version}"

_now=$(date +"%Y%m%d")
docker tag  genny-project/robot-testing:"${version}" genny-project/robot-testing:$_now
docker tag  genny-project/robot-testing:"${version}" genny-project/robot-testing:latest
docker push genny-project/robot-testing:$_now 
docker push genny-project/robot-testing:latest 
