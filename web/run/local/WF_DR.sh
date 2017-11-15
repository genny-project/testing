#!/usr/bin/env bash

cd ../../
PWD=`pwd`

#robot -d logs $PWD/tests/DR

robot -d logs $PWD/tests/DR/WF_DR_REGISTERUSER/WF_DR_REGISTERUSER.robot
robot -d logs $PWD/tests/DR/WF_DR_PROFILEUPDATE/WF_DR_PROFILEUPDATE.robot
robot -d logs $PWD/tests/DR/WF_DR_SETTINGS/WF_DR_SETTINGS_PASSWORDUPDATE.robot
robot -d logs $PWD/tests/DR/WF_DR_SETTINGS/WF_DR_SETTINGS_PAYMENTUPDATE.robot
robot -d logs $PWD/tests/DR/WF_DR_SETTINGS/WF_DR_SETTINGS_PROFILEUPDATE.robot
robot -d logs $PWD/tests/DR/WF_DR_SETTINGS/WF_DR_SETTINGS_LOADTYPES.robot
robot -d logs $PWD/tests/DR/WF_DR_SETTINGS/WF_DR_SETTINGS_TRUCKSPECIFICATIONS.robot
