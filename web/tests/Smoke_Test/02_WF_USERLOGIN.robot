*** Settings ***
Documentation   Tests to verify that the user can login with valid credentials

Library  ExtendedSelenium2Library
Library  OperatingSystem

Resource  ../resources/DR/VARIABLE_DR.robot
Resource  ../resources/DR/KEYWORDS_DR.robot

Suite Setup  INITIALIZE_SETUP
Suite Teardown  Terminate System

*** Variables ***
${screenshot_path_docker}  /home/robot-framework/screenshots/02_WF_USERLOGIN
${screenshot_path_local}  screenshots/02_WF_USERLOGIN

${screenshot_path}  ${screenshot_path_docker}  #Options: 'screenshot_path_local' or 'screenshot_path_docker'
${screenshot_name}  WF_DR_USERLOGIN_{index}.png


*** Test Cases ***
01_WF_USERLOGIN_TEST_REDIRECT
   [Tags]  Login
   WF_DR_AUTH_REDIRECT

02_WF_USERLOGIN_TEST_VALID_CREDENTIALS
   [Tags]  Login
   WF_DR_LOGIN  ${username_dr}  ${password_dr}
   WF_DR_SUCCESSFUL_LOGIN

03_WF_LOGOUT
   [Tags]  Login
   sleep  5s
   WF_DR_lOGOUT

04_WF_USERLOGIN_TEST_INVALID_CREDENTIALS
  [Tags]  SmokeTest
  WF_DR_LOGIN_USERLOGIN_TEST_INVALID_CREDENTIALS  ${username_dr_invalid}  ${password_dr_invalid}



*** Keywords ***
INITIALIZE_SETUP
   Initialize System

   ${status}=  run keyword and return status  Directory Should Exist  ${screenshot_path}
   Log  ${status}
   run keyword if  '${status}' == 'True'  Empty Directory  ${screenshot_path}

   set screenshot directory  ${screenshot_path}