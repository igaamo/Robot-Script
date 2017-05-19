*** Setting ***
Library    Selenium2Library
Resource    upload.robot


*** Variable ***
${BASE_URL}    http://nervgh.github.io/pages/angular-file-upload/examples/simple/
${BROWSER}    gc


*** Testcases ***
Upload Sample Case
    Open browser to upload page
    Choose File to upload single
    Count number of upload File
    Press Upload Button
    Wait Progress 100
    Check file name visible in upload queue


*** Keyword ***
Open browser to upload page
    Open Browser    ${BASE_URL}    browser=${BROWSER}

Choose File to upload single
    # Choose File    xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    D:/robot framework/debug.log
    upload.Choose File


Press Upload Button
    Click Button    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]


Wait Progress 100
    Wait Until Page Contains Element     xpath=//div[@style="width: 100%;"]


Check file name visible in upload queue
     Element Should Be Enabled    //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[3]
     Element Should Be Enabled    //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[3]
     Wait Until Page Contains Element     xpath=//div[@style="width: 100%;"]
     Element Should Be Disabled    //*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

Count number of upload File
    Wait Until Element Contains    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/p    Queue length: 2
    Xpath Should Match X Times    //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr    2

    ${filename1}=    Get Table Cell    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   2    1
    ${filename2}=    Get Table Cell    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   3    1

    Table Cell Should Contain    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   2    1    debug.log
    Table Cell Should Contain    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   3    1    selenium-screenshot-5.png

    # Log to Console    ${filename1}
    # Log to Console    ${filename2}

