*** Setting ***
Library    Selenium2Library
Library    Screenshot
# Suite Teardown    Close Browser

*** Variable ***
${BASE_URL}    http://www.facebook.com/
${BROWSER}    gc


*** Testcases ***

Register Fail Case Wrong Format Email
    Open Browser go to facebook website
    Fill in Personal Information    Nattawut    Uppasaen
    Fill in Email    gaamo@gmal.co    gaamo@gmal.co
    Fill in password    testaab00111
    Choose birthday   22   12   1987
    Choose gender    2
    Click create Account Button
    Expected Result Show message error
    ${text}=    Key in email    argument

*** Keyword ***


Open Browser go to facebook website
    Open Browser    ${BASE_URL}    browser=${BROWSER}

Fill in Personal Information
    [Arguments]    ${firstname}    ${lastname}
    Input Text    name=firstname    ${firstname}
    Input Text    name=lastname    ${lastname}

Fill in Email
    [Arguments]    ${email}    ${confirmemail}
    Input Text    name=reg_email__    ${email}
    Input Text    name=reg_email_confirmation__    ${confirmemail}

Fill in password
    [Arguments]    ${password}
    Input Password    name=reg_passwd__    ${password}


Choose birthday
    [Arguments]    ${bdate}    ${bmonth}    ${byear}
    Select From List By Value    name=birthday_day    ${bdate}
    Select From List By Value    name=birthday_month   ${bmonth}
    Select From List By Value    name=birthday_year    ${byear}


Choose gender
    [Arguments]    ${sex}
    Select Radio Button    sex    value=${sex}


Click create Account Button
    Click Button    name=websubmit

Expected Result Show message error
    Wait Until Element Is Visible    id=reg_error_inner
    Wait Until Element Contains    id=reg_error_inner    คุณป้อนอีเมลไม่ถูกต้อง โปรดตรวจสอบที่อยู่อีเมลแล้วลองอีกครั้ง
    ${text}=    Get text   id=reg_error_inner
    # Should Contain    ${text}    ป้อนอีเมลไม่ถูกต้อง
    # Should be Equal    ${text}    อีเมลถูกต้อง
    [Return]    ${text}

Key in email
    [Arguments]        ${text}
    Input Text    id=email    ${text}