#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi

docker push channel40/testing:"${version}"

_now=$(date +"%Y%m%d")
docker tag  channel40/testing:"${version}" channel40/testing:$_now
docker tag  channel40/testing:"${version}" channel40/testing:latest
docker push channel40/testing:$_now 
docker push channel40/testing:latest 
