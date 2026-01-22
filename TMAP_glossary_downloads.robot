*** Settings ***
Library    SeleniumLibrary
Resource   keyword_TMAP.resource

Suite Setup     Open Browser To Glossary
Suite Teardown  Close Browser

*** Test Cases ***
Verify TMAP Glossary PDF Opens - NL
    Store Main Window
    Click PDF Download Icon NL
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return

Verify TMAP Glossary PDF Opens - EN
    Store Main Window
    Click PDF Download Icon EN
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return

Verify TMAP Glossary PDF Opens - FR
    Store Main Window
    Click PDF Download Icon FR
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return

Verify TMAP Glossary PDF Opens - DE
    Store Main Window
    Click PDF Download Icon DE
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return

Verify TMAP Glossary PDF Opens - ES
    Store Main Window
    Click PDF Download Icon ES
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return

Verify TMAP Glossary PDF Opens - TR
    Store Main Window
    Click PDF Download Icon TR
    Switch To PDF Tab
    PDF Should Be Opened
    Close PDF Tab And Return
