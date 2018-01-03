#!/bin/bash
PWD=`pwd`
docker run -e WEB_URL=http://v2.channel40.com.au -v $PWD/tests:/home/robot-framework/tests -v $PWD/reports:/home/robot-framework-logs -v $PWD/resources:/home/robot-framework/resources -v $PWD/screenshots:/home/robot-framework/screenshots rohitcs/rohit-robot


#docker run -e WEB_URL=http://channel40-docker.channel40.com.au -v $PWD/reports:/opt/robotframework/reports -v $PWD/tests:/opt/robotframework/tests -v $PWD/resources:/opt/robotframework/resources -v $PWD/screenshots:/opt/robotframework/screenshots ppodgorsek/robot-framework