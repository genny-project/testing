#!/bin/bash
PWD=`pwd`
docker run -e WEB_URL=http://channel40-docker.channel40.com.au -v $PWD/tests/DR/WF_DR_SETTINGS:/home/robot-framework/tests/DR/WF_DR_SETTINGS -v $PWD/reports:/home/robot-framework-logs -v $PWD/resources:/home/robot-framework/resources -v $PWD/screenshots:/home/robot-framework/screenshots rohitcs/rohit-robot