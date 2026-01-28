*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TMAP_URL}        https://www.tmap.net/page/tmap-glossary-online/
${BROWSER}         Chrome
${SEARCH_BUTTON}   css:div.header-search-button
${SEARCH_INPUT}    id:keyword

*** Keywords ***
Open Browser To TMAP Glossary
    Open Browser    ${TMAP_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_BUTTON}    15s

Accept Cookies If Present
    Run Keyword And Ignore Error
    ...    Click Element    xpath://*[contains(text(),'Accept')]
    Sleep    1s

Scroll To Top
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    0.5s

Open Search Function
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    10s
    Click Element                    ${SEARCH_BUTTON}

Verify Search Input Is Visible
    Wait Until Page Contains Element    ${SEARCH_INPUT}    10s
