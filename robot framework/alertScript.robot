*** Setting ***
Library    Selenium2Library

*** Variable ***
${BASE_URL}    https://epit.rd.go.th/EFILING/RegController
${BROWSER}    gc


*** Testcases ***
Check Alert
    Open browser to RD forgot password
    Click forgot password
    Click Next
    Expected Result should be alert error

Check Alert Exit Cancel
    Open browser to RD forgot password
    Click forgot password
    Click Exit
    Click Cancel
    Back to Form

Check Alert Exit OK
    [Tags]   nowtest
    Open browser to RD forgot password
    Click forgot password
    Click Exit
    Click OK
    Back to first page

*** Keywords ***
Open browser to RD forgot password
    Open Browser    ${BASE_URL}    browser=${BROWSER}

Click forgot password
    Click Link    name=link_RegType1

Click Next
    Click Image    xpath=//*[@id="bNext"]

Expected Result should be alert error
    #Alert Should Be Present    ข้อความปฏิเสธ [E011] :${SPACE*2}กรุณาบันทึกทึกเลขประจำตัวผู้เสียภาษีอากร
    ${alertMsg}=    Get Alert Message
    Should Contain    ${alertMsg}    [E011]

Click Exit
    Click Image    //*[@id="bExit"]

Click Cancel
    Choose Cancel On Next Confirmation
    Confirm Action

Back to Form
      Wait Until Element Contains    xpath=//*[@id="head_reg_type_1"]    กรอกข้อมูลส่วนบุคคล สำหรับบุคคลธรรมดา


Click OK
    Confirm Action


Back to first page
    Location Should be    http://epit.rd.go.th/publish/index.php