#!/bin/bash

cd ../../
PWD=`pwd`

docker run -e WEB_URL=${1}/ -v $PWD/tests/smokeTest:/home/robot-framework/tests/smokeTest -v $PWD/reports:/home/robot-framework-logs -v $PWD/resources:/home/robot-framework/resources -v $PWD/screenshots:/home/robot-framework/screenshots rohitcs/rohit-robot
