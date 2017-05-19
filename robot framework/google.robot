*** Setting ***
Library    Selenium2Library
Test Teardown    Close Browser

*** Variables ***
${BASE_URL}    http://www.google.com
${BROWSER}    gc


*** Testcases ***

Search robot
    Open browser to open google.com
    Fill in Data    robot
    Press Enter
    Found contails in result page    robot

Search python
    [Tags]    testing
    Open browser to open google.com
    Fill in Data    python
    Press Enter
    Found contails in result page    python


*** Keywords ***
Open browser to open google.com
    Open Browser    ${BASE_URL}    browser=${BROWSER} 
    
Fill in Data
    [Arguments]    ${search_keyword}
    Input Text    id=lst-ib    ${search_keyword}

Press Enter
    Press Key    id=lst-ib    \\13

Found contails in result page
    [Arguments]    ${result}
    Wait Until Page Contains    ${result}
