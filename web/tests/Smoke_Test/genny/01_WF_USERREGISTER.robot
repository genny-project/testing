*** Settings ***
Documentation   Tests to verify that the user can login with valid credentials

Library  ExtendedSelenium2Library
Library  OperatingSystem

Resource  ../../resources/DR/VARIABLE_DR.robot
Resource  ../../resources/DR/KEYWORDS_DR.robot

Suite Setup  INITIALIZE_SETUP
Suite Teardown  Terminate System

*** Variables ***
${screenshot_path}  /opt/robotframework/reports/screenshots/01_WF_USERREGISTER
${screenshot_name}  WF_USERREGISTER{index}.png


*** Test Cases ***
01_WF_USERREGISTER_TEST_REDIRECT
   [Tags]  Register
   WF_DR_AUTH_REDIRECT

*** Keywords ***
INITIALIZE_SETUP
   Initialize System

   ${status}=  run keyword and return status  Directory Should Exist  ${screenshot_path}
   Log  ${status}
   run keyword if  '${status}' == 'True'  Empty Directory  ${screenshot_path}

   set screenshot directory  ${screenshot_path}
