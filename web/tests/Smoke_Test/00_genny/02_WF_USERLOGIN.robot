*** Settings ***
Documentation   Tests to verify that the user can login with valid credentials

Library  ExtendedSelenium2Library
Library  OperatingSystem

Resource  ../../resources/DR/VARIABLE_DR.robot
Resource  ../../resources/DR/KEYWORDS_DR.robot

Suite Setup  INITIALIZE_SETUP
Suite Teardown  Terminate System

*** Variables ***
${screenshot_path}  /opt/robotframework/reports/screenshots/02_WF_USERLOGIN
${screenshot_name}  WF_USERLOGIN{index}.png


*** Test Cases ***
# 01_WF_USERLOGIN_TEST_REDIRECT
#    [Tags]  Login
#    WF_DR_AUTH_REDIRECT
#
# 02_WF_USERLOGIN_TEST_VALID_CREDENTIALS
#    [Tags]  Login
#    WF_DR_LOGIN  ${username_dr}  ${password_dr}
#    WF_DR_SUCCESSFUL_LOGIN
#
# 03_WF_LOGOUT
#    [Tags]  Login
#    sleep  5s
#    WF_DR_lOGOUT
#
# 04_WF_USERLOGIN_TEST_INVALID_CREDENTIALS
#   [Tags]  SmokeTest
#   WF_DR_LOGIN_USERLOGIN_TEST_INVALID_CREDENTIALS  ${username_dr_invalid}  ${password_dr_invalid}

01_WF_BUCKETS_LOGIN
  [Tags]  Buckets
   WF_DR_AUTH_REDIRECT
   WF_DR_LOGIN  ${username_dr}  ${password_dr}
   #WF_DR_SUCCESSFUL_LOGIN
   #WF_DR_FILL_PROFILE
   #WF_DR_SUBMIT_PROFILE
   #WF_DR_MOBILE_VERIFICATION
   #WF_DR_TANDC
   WF_DR_SUCCESSFUL_TANDC

02_WF_BUCKETS_NEWLOAD
  [Tags]  Buckets
   WF_DR_OPEN_ADD_LOAD
   WF_DR_ADD_LOAD
   WF_DR_SUCCESSFUL_ADD_LOAD

03_WF_BUCKETS_CHECKLOAD
  [Tags]  Buckets
   WF_DR_CHECK_LOAD



*** Keywords ***
INITIALIZE_SETUP
   Initialize System

   ${status}=  run keyword and return status  Directory Should Exist  ${screenshot_path}
   Log  ${status}
   run keyword if  '${status}' == 'True'  Empty Directory  ${screenshot_path}

   set screenshot directory  ${screenshot_path}
