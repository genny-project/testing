*** Settings ***
Library           ExtendedSelenium2Library



*** Variables ***
${URL}            %{WEB_URL}
${BROWSER LOCAL}  chrome
${DELAY}          0
${INQUIRE}        css=a.header__menu-item--always-show
${CONTACT}        css=div.hs_phone

*** Keywords ***


Open Browser To Home Page(Local)
	[Arguments]  ${BROWSER}  ${BROWSER VERSION}  ${OS}  ${OS VERSION}
	Open Browser  url=${URL}  browser=chrome  alias=None  remote_url=http://%{BROWSERSTACK_USER}:%{BROWSERSTACK_TOKEN}@hub.browserstack.com:80/wd/hub  desired_capabilities=browser:${BROWSER},browser_version:${BROWSER VERSION},os:${OS}, os_version:${OS VERSION},resolution:1920x1080,browserstack.local:true

Open Browser To Home Page
	[Arguments]  ${BROWSER}  ${BROWSER VERSION}  ${OS}  ${OS VERSION}
	Open Browser  url=${URL}  browser=chrome  alias=None  remote_url=http://%{BROWSERSTACK_USER}:%{BROWSERSTACK_TOKEN}@hub.browserstack.com:80/wd/hub  desired_capabilities=browser:${BROWSER},browser_version:${BROWSER VERSION},os:${OS}, os_version:${OS VERSION},resolution:1920x1080

User Selects Inquire
	Element Should Be Visible  ${INQUIRE}
	Click Element  ${INQUIRE}
	Wait Until Page Contains Element  ${CONTACT}
