*** Settings ***
Library    SeleniumLibrary
Resource   TMAP_search_function_keyword.resource

Suite Setup     Open Browser To TMAP Glossary
Suite Teardown  Close Browser

*** Test Cases ***
Search Function Opens Successfully
    Accept Cookies If Present
    Scroll To Top
    Open Search Function
    Verify Search Input Is Visible
    Capture Page Screenshot
