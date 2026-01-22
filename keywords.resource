*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Perform Valid Login
    Input Text    id=username    student
    Input Text    id=password    Password123
    Click Button    id=submit
    Page Should Contain    Logged In Successfully

Perform Invalid Username
    Input Text    id=username    incorrectUser
    Input Text    id=password    Password123
    Click Button    id=submit
    Page Should Contain    Your username is invalid!

Perform Invalid Password
    Input Text    id=username    student
    Input Text    id=password    incorrectPassword
    Click Button    id=submit
    Page Should Contain    Your password is invalid!


Perform Valid Login SauceDemo
    Wait Until Element Is Visible    id=user-name    10s
    Input Text    id=user-name    standard_user
    Input Text    id=password     secret_sauce
    Click Button    id=login-button
    Page Should Contain    Products

Information Buyer
    Input Text    id=first-name   QA
    Input Text    id=last-name    Tester
    Input Text    id=postal-code    1000AA
    Click Button    id=continue

Overview Checkout
    Page Should Contain    Checkout: Overview
    Page Should Contain    Sauce Labs Backpack
    Page Should Contain    Sauce Labs Bike Light

*** Keywords ***
Check Window Count Increased
    [Arguments]    ${before}
    ${handles}=    Get Window Handles
    ${count}=      Get Length    ${handles}
    ${expected}=   Evaluate    ${before} + 1
    Should Be Equal As Integers    ${count}    ${expected}

