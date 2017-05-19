*** Setting ***
Resource    resources/loginshare.robot
Suite Setup    Open Browser to site http://localhost:7272/
Suite Teardown    Close Browser


*** Testcases ***

Login Success
    [Template]    Login Fill Data
        demo    mode

Verify
    User must see the welcome page and link to log out
    Click Logout
    Back to Login Page and show Login Page


*** Keywords ***

# Open Browser to site http://localhost:7272/
#     Open Browser    ${BASE_URL}    browser=${BROWSER}


# Fill in username and password
#     Input Text    id=username_field    demo
#     Input Text    id=password_field    mode

# Click Submit
#     Press Key    id=password_field    \\13

User must see the welcome page and link to log out
    Wait Until Element Contains    id=container    Welcome Page
    Page Should Contain Link    xpath=//*[@id="container"]/p/a

Click Logout
    Click Link    logout
//  Click Element    xpath=xpath=//*[@id="container"]/p/a

Back to Login Page and show Login Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Login Page