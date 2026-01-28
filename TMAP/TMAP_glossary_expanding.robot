*** Settings ***
Resource        TMAP_glossary_expanding.resource
Suite Setup     Open Browser To Glossary
Suite Teardown  Close Browser Cleanly

*** Test Cases ***
Open All TMAP Glossary Items
    [Documentation]    Open all glossary sections and all underlying terms
    Accept Cookies If Present
    Open All Nested Glossary Items
    Verify All Glossary Items Are Open
    Capture Page Screenshot
