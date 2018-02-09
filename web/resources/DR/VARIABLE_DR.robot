*** Settings ***
Library   OperatingSystem

*** Variables ***

${url}  %{WEB_URL}
${keycloak_url}  %{KEYCLOAK_URL}
${browser}  %{BROWSER}


#valid creds
${email_dr}               truckdriver12341@gmail.com
${username_dr}            user1
${password_dr}            password1
${screenshot_path_local}  screenshots

#new creds
${new_email_dr}           thetruckdriver@testemail.com
${new_firstname_dr}       thetruck
${new_lastname_dr}        driver
${new_password_dr}        thetruckdriver123

#invalid creds
${email_dr_invalid}       test@invalid.com
${username_dr_invalid}    userinvalid
${password_dr_invalid}    passwordinvalid

#User details to test the User Registration
${email_id}               truckdriver12341+test36@gmail.com
${username}               truckdriver12341test36
${password}               password12341
${verification_type}      email   #Options: 'email' or 'sms'
