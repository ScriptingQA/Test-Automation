*** Settings ***
Library    SeleniumLibrary
Resource   TMAP_download_checklist_keyword.resource

Suite Setup     Open Download Checklists Page
Suite Teardown  Close Browser

*** Test Cases ***
Verify Download Templates Link Works
    Click Download Templates Link
    Verify On Download Templates Page
    Go Back

Verify Download Tools Link Works
    Click Download Tools Link
    Verify On Download Tools Page
