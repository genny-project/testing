#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi

docker push gennyproject/robot:"${version}"

_now=$(date +"%Y%m%d")
docker tag  gennyproject/robot:"${version}" gennyproject/robot:$_now
docker tag  gennyproject/robot:"${version}" gennyproject/robot:latest
docker push gennyproject/robot:$_now 
docker push gennyproject/robot:latest 
