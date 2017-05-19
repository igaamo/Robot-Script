*** Setting ***
Resource    resources/share.robot
Suite Setup    Open browser to open google.com
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}    http://www.google.com
${BROWSER}    gc


*** Testcases ***
Search not found rule
    [Template]    Search workflow
    #----------------------------------
    #  keyword   |   expected result   |
    #----------------------------------
        pythonx         not found
        robotx          not found
        testx           not found