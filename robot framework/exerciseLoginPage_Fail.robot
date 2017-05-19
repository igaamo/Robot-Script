*** Setting ***
Resource    resources/loginshare.robot
Suite Setup    Open login Page
Suite Teardown    Close Browser
Test Teardown    Go back to login page
Test Template    Login Fail flow


*** Variables ***
${BASE_URL}    http://localhost:7272/
${BROWSER}    gc


*** Testcases ***

Login Fail Wrong Username
       username    mode

Login Fail Wrong passwoerd
        demo    password

Login Fail Wrong username and passwoerd
        username    password

Login Fail Wrong Missing username
        ${EMPTY}    password

Login Fail Wrong Missing password
        demo    ${EMPTY}

Login Fail Wrong Missing
        ${EMPTY}    ${EMPTY}


*** Keyword ***
Open login Page
    Open Browser    ${BASE_URL}    browser=${BROWSER}

Go back to login page
    GO To    ${BASE_URL}