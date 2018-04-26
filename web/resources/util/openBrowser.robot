*** Settings ***
Library           ExtendedSelenium2Library



*** Variables ***
${URL}            %{WEB_URL}

*** Keywords ***
Open Browser To Home Page(Local)
	Log To Console  opening ${web_url}
	open browser  ${web_url}  ${browser}
	Set Window Size  1920  1080
	set screenshot directory  ${screenshot_path}
	capture page screenshot  ${screenshot_name}

Open Browser To Home Page
	[Arguments]  ${BROWSER}  ${BROWSER VERSION}  ${OS}  ${OS VERSION}
	Open Browser  url=${URL}  browser=chrome  alias=None  remote_url=http://%{BROWSERSTACK_USER}:%{BROWSERSTACK_TOKEN}@hub.browserstack.com:80/wd/hub  desired_capabilities=browser:${BROWSER},browser_version:${BROWSER VERSION},os:${OS}, os_version:${OS VERSION},resolution:1920x1080
