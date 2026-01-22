*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}         chrome
${GLOSSARY_URL}    https://www.tmap.net/page/tmap-glossary-online/

*** Keywords ***
Open Browser To Glossary
    Open Browser    ${GLOSSARY_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css:a.download-icon    15s

Store Main Window
    ${handles}=    Get Window Handles
    Set Suite Variable    ${MAIN_WINDOW}    ${handles}[0]

Click PDF Download Icon NL
    Execute JavaScript    document.querySelectorAll("a.download-icon")[0].click();

Click PDF Download Icon EN
    Execute JavaScript    document.querySelectorAll("a.download-icon")[1].click();

Click PDF Download Icon FR
    Execute JavaScript    document.querySelectorAll("a.download-icon")[2].click();

Click PDF Download Icon DE
    Execute JavaScript    document.querySelectorAll("a.download-icon")[3].click();

Click PDF Download Icon ES
    Execute JavaScript    document.querySelectorAll("a.download-icon")[4].click();

Click PDF Download Icon TR
    Execute JavaScript    document.querySelectorAll("a.download-icon")[5].click();

Switch To PDF Tab
    ${handles}=    Get Window Handles
    ${count}=    Get Length    ${handles}
    Should Be True    ${count} > 1
    Switch Window    ${handles}[1]

PDF Should Be Opened
    ${url}=    Get Location
    Log    Opened PDF URL: ${url}
    Should Match Regexp    ${url}    (pdf|blob:|uploads)

Close PDF Tab And Return
    Close Window
    Switch Window    ${MAIN_WINDOW}
