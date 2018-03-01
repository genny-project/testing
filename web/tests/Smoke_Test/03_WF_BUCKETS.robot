*** Settings ***
Documentation   Tests to verify that the user can login with valid credentials

Library  ExtendedSelenium2Library
Library  OperatingSystem

Resource  ../resources/DR/VARIABLE_DR.robot
Resource  ../resources/DR/KEYWORDS_DR.robot

Suite Setup  INITIALIZE_SETUP
Suite Teardown  Terminate System

*** Variables ***
${screenshot_path}  /opt/robotframework/reports/screenshots/03_WF_BUCKETS
${screenshot_name}  WF_BUCKETS{index}.png


*** Test Cases ***
01_WF_BUCKETS_LOGIN
   [Tags]  Buckets
   WF_DR_AUTH_REDIRECT
   WF_DR_LOGIN  ${username_dr}  ${password_dr}
   WF_DR_SUCCESSFUL_LOGIN

02_WF_BUCKETS_NEWLOAD
    [Tags]  Buckets
    WF_DR_OPEN_ADD_LOAD
    WF_DR_ADD_LOAD

03_WF_BUCKETS_CHECKLOAD
    [Tags] Buckets
    WF_DR_CHECK_LOAD


*** Keywords ***
INITIALIZE_SETUP
   Initialize System

   ${status}=  run keyword and return status  Directory Should Exist  ${screenshot_path}
   Log  ${status}
   run keyword if  '${status}' == 'True'  Empty Directory  ${screenshot_path}

   set screenshot directory  ${screenshot_path}
