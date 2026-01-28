*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${GLOSSARY_URL}   https://www.tmap.net/page/tmap-glossary-online/

*** Keywords ***
Open Browser To Glossary
    Open Browser    ${GLOSSARY_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//details    15s

Accept Cookies If Present
    Run Keyword And Ignore Error
    ...    Click Button    xpath=//button[normalize-space()='Accept']
    Sleep    0.5s

Scroll To Bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    1s

Open All Nested Glossary Items
    # Pass 1
    Execute JavaScript
    ...    document.querySelectorAll("details").forEach(d => d.open = true);
    Sleep    0.5s

    # Scroll & Pass 2
    Scroll To Bottom
    Execute JavaScript
    ...    document.querySelectorAll("details").forEach(d => d.open = true);
    Sleep    0.5s

    # Final safety pass
    Execute JavaScript
    ...    document.querySelectorAll("details").forEach(d => d.open = true);

Verify All Glossary Items Are Open
    Page Should Not Contain Element    xpath=//details[not(@open)]

Close Browser Cleanly
    Close Browser
