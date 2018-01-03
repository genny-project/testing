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


WF_DR_LOGIN
    [Arguments]   ${username}   ${password}
    wait until page contains element  id=username   20s
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
    wait until element is enabled  xpath=//*[@id="kc-form"]/form/div/div[3]/div[4]/button   10
    click element  xpath=//*[@id="kc-form"]/form/div/div[3]/div[4]/button

WF_DR_SUCCESSFUL_LOGIN
    wait until page contains element  xpath=//*[@id="root"]/div/div/div/main/content/div/div/div/div/div[2]/div/div[1]/div/div/div[1]/div/div[2]/div/div/span/div/span  15s
    capture page screenshot  ${screenshot_name}

WF_DR_lOGOUT
    click element  xpath=//*[@id="root"]/div/div/div/main/content/div/div/div/div/div[2]/div/div[1]/div/div/div[1]/div/div[2]/div/div/span/div/span
    wait until page contains element  css=.dropdown-profile > li:nth-child(3)
    capture page screenshot  ${screenshot_name}
    click element  css=.dropdown-profile > li:nth-child(3)
    wait until page contains element  css=div.login-container  15
    capture page screenshot  ${screenshot_name}

WF_DR_LOGIN_USERLOGIN_TEST_INVALID_CREDENTIALS
  [Arguments]   ${username}   ${password}
  WF_DR_LOGIN_ENTERUSERNAME  ${username}
  WF_DR_LOGIN_ENTERPASSWORD  ${password}
  WF_DR_LOGIN_CLICKLOGIN
  wait until page contains element  css=.alert.alert-error   5s
  capture page screenshot  ${screenshot_name}

Terminate System
    sleep  20s
    close browser

