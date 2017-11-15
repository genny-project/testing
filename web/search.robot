*** Settings ***
Documentation   This is a basic test
Library  Selenium2Library
Suite Setup  Go to homepage
Suite Teardown  Close All Browsers

*** Variables ***
${BROWSER}  firefox 
${HOMEPAGE}  https://www.google.com.au/?gfe_rd=cr&ei=NW8_WZezM-nc8wfT06KwBA

*** Test Cases ***
Driver Login
    [Documentation]    The truck driver should be able to login

    Maximize Browser Window
	Log Title
    Google and check result  devops  www.eficode.fi


*** Keywords ***

Go to homepage
    open browser  ${HOMEPAGE}  ${BROWSER}

Google and check result
    [Arguments]  ${searchkey}  ${result}
    input text  id=q  ${searchkey}
    click button  id=_fZl
    wait until page contains  ${result}
