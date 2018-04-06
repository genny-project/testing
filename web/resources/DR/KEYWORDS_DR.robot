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
    Log To Console  opening ${web_url}
    open browser  ${web_url}  ${browser}
    Set Window Size  1920  1080
    set screenshot directory  ${screenshot_path}
    capture page screenshot  ${screenshot_name}
    sleep  30s

WF_DR_REGISTER
    wait until page contains element  css=.button-register  5
    capture page screenshot  ${screenshot_name}

    click element css:.button-register
    Location Should Contain  registration
    capture page screenshot  ${screenshot_name}

    input text     id=email  ${new_email_dr}
    input text     id=firstName  ${new_firstname_dr}
    input text     id=lastName  ${new_lastname_dr}
    input text     id=password  ${new_password_dr}
    input text     id=password-confirm  ${new_password_dr}
    capture page screenshot  ${screenshot_name}

    click element  css:button[type=submit]

WF_DR_AUTH_REDIRECT
    go to  ${web_url}
    sleep  5s
    Location Should Contain   auth

WF_DR_LOGIN
    [Arguments]   ${username}   ${password}
    wait until page contains element  id=username   5
    sleep  2s
    capture page screenshot  ${screenshot_name}
    WF_DR_LOGIN_ENTERUSERNAME  ${username}
    WF_DR_LOGIN_ENTERPASSWORD  ${password}
    WF_DR_LOGIN_CLICKLOGIN


#fills out profile - date of birth and business location
WF_DR_FILL_PROFILE
    click element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > div > div:nth-child(2) > div.react-datepicker-wrapper > div > input
    sleep  2s
    click element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > div > div:nth-child(2) > div.react-datepicker-popper > div > div.react-datepicker__month-container > div.react-datepicker__month > div:nth-child(1) > div.react-datepicker__day.react-datepicker__day--sun.react-datepicker__day--weekend
    sleep  2s

    click element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(6) > div > div.grid > div > div:nth-child(1) > div > input
    input text  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(6) > div > div.grid > div > div:nth-child(1) > div > input  121 Cardigan St, Carlton VIC 3053, Australia
    Click Element  css=#PlacesAutocomplete__autocomplete-container > div:nth-child(1)

#checks the submit button is clickable then submits
WF_DR_SUBMIT_PROFILE
    click element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div.grid > div > div > div > button

WF_DR_MOBILE_VERIFICATION
    wait until page contains element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div > div.passcode > div  10
    reload page

#scrolls through TAndC and accepts
WF_DR_TANDC
    wait until page contains element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div.genny-form > div > div > div > div > div:nth-child(2) > div > div > div.input-terms-main  10
    sleep  2s
    Execute JavaScript  document.querySelector('.input-terms-main').scrollTop = document.querySelector('.input-terms-main').scrollHeight - document.querySelector('.input-terms-main').offsetHeight;
    sleep  5s
    #reload page
    click element  css=content > div > div > div > div > div > div > div:nth-child(2) > div > div > div.genny-form > div > div > div > div > div.grid > div > div > div

WF_DR_SUCCESSFUL_TANDC
    wait until page contains element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-holder > div.view-tab.clickable.selected > span.tab-title  30
    sleep  5s

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
    wait until page contains element  css=content > div > div > div > div > div > div > div:nth-child(1) > div > div > div.grid.header.main-header > div > div:nth-child(1)  10
    capture page screenshot  ${screenshot_name}


WF_DR_LOGOUT
    click element  css=div.dropdown > div.dropdown-header > span
    wait until page contains element  css=.dropdown-profile > li:last-child  2
    capture page screenshot  ${screenshot_name}
    click element  css=.dropdown-profile > li:last-child
    wait until page contains element  css=div.login-container  15
    capture page screenshot  ${screenshot_name}

WF_DR_LOGIN_USERLOGIN_TEST_INVALID_CREDENTIALS
  [Arguments]   ${username}   ${password}
  WF_DR_LOGIN_ENTERUSERNAME  ${username}
  WF_DR_LOGIN_ENTERPASSWORD  ${password}
  WF_DR_LOGIN_CLICKLOGIN
  wait until page contains element  css=.alert.alert-error   5
  capture page screenshot  ${screenshot_name}

WF_DR_OPEN_ADD_LOAD
  click element  css=div:nth-child(2) > div > div:nth-child(1) > div > div > div > div > button
  capture page screenshot  ${screenshot_name}
  sleep  5s

WF_DR_ADD_LOAD
  capture page screenshot  ${screenshot_name}
  #load details
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div > input[type="text"]  Test Load
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div > textarea  This is a test load
  capture page screenshot  ${screenshot_name}

  Click Element  css=#downshift-1-input
  wait until page contains element  css=#downshift-1-item-10  2
  Click Element  css=#downshift-1-item-10
  capture page screenshot  ${screenshot_name}

  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(1) > div > input[type="text"]  100
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(2) > div > input[type="text"]  100
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > div > input[type="text"]  100
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(4) > div > input[type="text"]  100
  capture page screenshot  ${screenshot_name}

  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(1) > div > div > div > div > div:nth-child(2) > div:nth-child(4) > div > input[type="text"]  Test Reference
  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(1) > div > div.input.input-text > input[type="text"]  1000
  capture page screenshot  ${screenshot_name}

  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(2) > div > div.grid > div > div:nth-child(1) > #PlacesAutocomplete__root > input[type="text"]  1 Collins St, Melbourne
  sleep  2s
  capture page screenshot  ${screenshot_name}
  Click Element  css=#PlacesAutocomplete__autocomplete-container > div:nth-child(1)

  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div > div:nth-child(2) > div.react-datepicker-wrapper > div > input  2018-01-01 00:00
  capture page screenshot  ${screenshot_name}
  click element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(3) > div > div:nth-child(2) > div.react-datepicker-popper > div > div.react-datepicker__time-container > div.react-datepicker__time > div > ul > li.react-datepicker__time-list-item.react-datepicker__time-list-item--selected
  capture page screenshot  ${screenshot_name}

  input text  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(4) > div > div.grid > div > div:nth-child(1) > #PlacesAutocomplete__root > input[type="text"]  1 George St, Sydney
  sleep  2s
  capture page screenshot  ${screenshot_name}
  Click Element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(4) > div > div.grid > div > div:nth-child(1) > #PlacesAutocomplete__root > #PlacesAutocomplete__autocomplete-container > div:nth-child(1)
  capture page screenshot  ${screenshot_name}

  Click Element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div:nth-child(2) > div:nth-child(5) > div > div:nth-child(2) > div.react-datepicker-wrapper > div > input
  capture page screenshot  ${screenshot_name}

  Click Element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div.grid > div > div:nth-child(2) > div > button
  capture page screenshot  ${screenshot_name}


  reload page
  sleep  10s
  capture page screenshot  ${screenshot_name}
  Click Element  css=content > div > div > div > div > div:nth-child(1) > div > div > div:nth-child(2) > div > div > div > ul > li:nth-child(1) > div > span.icon-small.tree-view-icon.arrow.clickable.close > i
  capture page screenshot  ${screenshot_name}
  Click Element  css=content > div > div > div > div > div:nth-child(1) > div > div > div:nth-child(2) > div > div > div > ul > li:nth-child(1) > ul > li:last-child > div > span > span
  capture page screenshot  ${screenshot_name}

  sleep  5s

  Click Element  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div:nth-child(2) > div > div > div > div > div.grid > div > div:nth-child(2) > div > button
  capture page screenshot  ${screenshot_name}

  sleep  10s

  capture page screenshot  ${screenshot_name}

  reload page

  sleep 10s

  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > h5  Test Load
  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div > div > div:nth-child(1) > span  $1,000

  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > span:nth-child(2)  Melbourne
  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > span:nth-child(4)  VIC

  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > span:nth-child(2)  Sydney
  Element Text Should Be  css=content > div > div > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div:nth-child(2) > div > div > div.tab-container-content > div > div > div.bucket-column.bucket-number-1 > div.bucket.size-lg > div > div > div > div > div > div.grid > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > span:nth-child(4)  NSW


  capture page screenshot  ${screenshot_name}



Terminate System
    Warn Any Javascript Errors
    close browser
