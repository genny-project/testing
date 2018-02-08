*** Settings ***
Documentation   List of common keywords/methods

Library   ExtendedSelenium2Library
Library   OperatingSystem

Resource  ./VARIABLE_DR.robot


*** Variables ***
${screenshot_path}  /opt/robotframework/reports/screenshots
${screenshot_name}  WF_DR_{index}.png

*** Keywords ***
Initialize System
    sleep  5s
    ${url}=    Get Environment Variable  WEB_URL
    ${keycloak_url}=  Get Environment Variable KEYCLOAKURL
    open browser  ${url}  ${browser}
    sleep  5s
    set screenshot directory  ${screenshot_path}
    capture page screenshot  ${screenshot_name}

WF_DR_REGISTER
    wait until page contains element  css=.button-register  5
    capture page screenshot  ${screenshot_name}

    click element css:.button-register
    Location Should Contain  registration
    capture page screenshot  ${screenshot_name}

    input text     id=email  ${new_email_dr}
    input text     id=firstName  ${new_firstname_dr}
    input text     id=lastName  ${new_lastname_dr}
    input text     id=email  ${new_email_dr}
    input text     id=password  ${new_password_dr}
    input text     id=password-confirm  ${new_password_dr}
    capture page screenshot  ${screenshot_name}

    click element  css:button[type=submit]

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
    wait until page contains element  css=.grid.header.main-header > div > div:nth-child(1) > h3  15
    capture page screenshot  ${screenshot_name}

WF_DR_LOGOUT
    click element  css=div.dropdown > div.dropdown-header > span
    wait until page contains element  css=.dropdown-profile > li:last-child  2
    capture page screenshot  ${screenshot_name}
    click element  css=.dropdown-profile > li:last-child
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
    sleep  5s
    Warn Any Javascript Errors
    close browser
