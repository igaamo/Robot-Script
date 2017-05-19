*** Setting ***
Library    Selenium2Library


*** Keywords ***

Login Fail flow
    [Arguments]    ${username}    ${password}
    Fill in     ${username}    ${password}
    Click Submit
    User must see the Error Page

Fill in
    [Arguments]    ${username}    ${password}
    Input Text    id=username_field    ${username}
    Input Text    id=password_field    ${password}

Click Submit
    Press Key    id=password_field    \\13

User must see the Error Page
    Wait Until Element Contains    id=container    Error Page