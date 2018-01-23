*** Settings ***
Library   OperatingSystem

*** Variables ***

${url}  http://v2.channel40.com.au       #http://channel40-web-dev.channel40.com.au:81/
${browser}  %{BROWSER}

#Screenshot Path
${screenshot_path_docker}  /home/robot-framework/screenshots
${screenshot_path_local}  screenshots


${email_dr}     truckdriver12341@gmail.com
${username_dr}  user1
${password_dr}  password1

#invalid creds
${email_dr_invalid}     test@invalid.com
${username_dr_invalid}  userinvalid
${password_dr_invalid}  passwordinvalid

#User details to test the User Registration
${email_id}     truckdriver12341+test36@gmail.com
${username}     truckdriver12341test36
${password}     password12341
${verification_type}  email   #Options: 'email' or 'sms'



