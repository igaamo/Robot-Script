*** Setting ***
Library    Selenium2Library


*** Variables ***
${BASE_URL}    http://www.google.com
${BROWSER}    gc


*** Keywords ***
Search Workflow
    [Arguments]    ${search_keyword}    ${result}
    Fill in Data    ${search_keyword}
    Press Enter
    Found contails in result page    ${result}
    Go To    ${BASE_URL}

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