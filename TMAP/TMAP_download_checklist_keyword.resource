*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://www.tmap.net/page/download-checklists/

*** Keywords ***
Open Download Checklists Page
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Accept Cookies
    Wait Until Page Contains Element
    ...    xpath://a[normalize-space()='Download templates']    20s

Accept Cookies
    Wait Until Element Is Visible
    ...    xpath://button[normalize-space()='Accept']    15s
    Click Element
    ...    xpath://button[normalize-space()='Accept']
    Wait Until Element Does Not Exist
    ...    xpath://button[normalize-space()='Accept']    15s

Click Download Templates Link
    Click Element
    ...    xpath://a[normalize-space()='Download templates']

Click Download Tools Link
    Click Element
    ...    xpath://a[normalize-space()='Download tools']

Verify On Download Templates Page
    Wait Until Location Contains    /page/download-templates    10s

Verify On Download Tools Page
    Wait Until Location Contains    /page/download-tools    10s
