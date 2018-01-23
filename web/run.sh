#!/bin/bash
PWD=`pwd`

docker run -e WEB_URL=http://v2.channel40.com.au -e BROWSER=chrome -v $PWD/reports:/opt/robotframework/reports -v $PWD/screenshots:/home/robotframework/screenshots gennyproject/robot:latest
