*** Setting ***
Library    Selenium2Library

*** Keywords ***

Verify Login Fail
    Wait Until Element Contains    id=container    Error Page
    Go To    http://localhost:7272/