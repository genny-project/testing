*** Settings ***
Documentation   List of common keywords/methods

Library   Selenium2Library
Library   OperatingSystem

Resource  ./VARIABLE_DR.robot


*** Variables ***
${screenshot_path}  ${screenshot_path_local}  #Options: 'screenshot_path_local' or 'screenshot_path_docker'
${screenshot_name}  WF_DR_{index}.png

*** Keywords ***
Initialize System
    ${url}=    Get Environment Variable  WEB_URL
    open browser  ${url}  ${browser}
    maximize browser window
    sleep  5s
    set screenshot directory  ${screenshot_path}
    capture page screenshot  ${screenshot_name}

WF_DR_AUTH_REDIRECT
    Location Should Contain   auth

WF_DR_LOGIN
    [Arguments]   ${username}   ${password}
    wait until page contains element  id=username   10
    sleep  5s
    capture page screenshot  ${screenshot_name}
    WF_DR_LOGIN_ENTERUSERNAME  ${username}
    WF_DR_LOGIN_ENTERPASSWORD  ${password}
    WF_DR_LOGIN_CLICKLOGIN

WF_DR_LOGIN_ENTERUSERNAME
    [Arguments]   ${username}
    input text  id=username   ${username}
    sleep  1s
    capture page screenshot  ${screenshot_name}

WF_DR_LOGIN_ENTERPASSWORD
    [Arguments]   ${password}
    input password  id=password    ${password}
    sleep  1s
    capture page screenshot  ${screenshot_name}

WF_DR_LOGIN_CLICKLOGIN
    wait until element is enabled  css=.login-container > .input-detail > .input-submit > button   10
    click element  css=.login-container > .input-detail > .input-submit > button

WF_DR_SUCCESSFUL_LOGIN
    wait until page contains element  css=.grid.header.main-header > div > div:nth-child(1) > .label > span.label-text  15
    capture page screenshot  ${screenshot_name}

WF_DR_LOGOUT
    click element  css=div.dropdown > div.dropdown-header > span
    wait until page contains element  css=.dropdown-profile > li:nth-child(3)  2
    capture page screenshot  ${screenshot_name}
    click element  css=.dropdown-profile > li:nth-child(3)
    wait until page contains element  css=div.login-container  10
    capture page screenshot  ${screenshot_name}

WF_DR_LOGIN_USERLOGIN_TEST_INVALID_CREDENTIALS
  [Arguments]   ${username}   ${password}
  WF_DR_LOGIN_ENTERUSERNAME  ${username}
  WF_DR_LOGIN_ENTERPASSWORD  ${password}
  WF_DR_LOGIN_CLICKLOGIN
  wait until page contains element  css=.alert.alert-error   5
  capture page screenshot  ${screenshot_name}

Terminate System
    sleep  20s
    close browser

