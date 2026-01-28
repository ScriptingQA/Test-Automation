*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   keywords.resource

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Verifies the login of a user.
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Sleep    5s
    Perform Valid Login
    Close Browser 

Login With inValid Username
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Sleep    5s
    Perform Invalid Username
    Close Browser

Login With inValid Password
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Sleep    5s
    Perform Invalid Password
    Close Browser

Login And Add Your Favorite Foods
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Perform Valid Login
    Click Link    Practice
    Click Link    Test Exceptions
    Wait Until Element Is Visible    id=row1    10s
    Click Button    id=add_btn
    Wait Until Element Is Visible    id=row2    10s
    Wait Until Element Is Enabled    id=row2    10s
    Input Text    css=#row2 input    Potato

Go To Link And Save Your Favorite Food
    Open Browser    https://practicetestautomation.com/practice-test-exceptions/    chrome
    Click Button    id=add_btn
    Wait Until Element Is Visible    css=#row2 input    10s
    Wait Until Element Is Enabled    css=#row2 input    10s
    Input Text    css=#row2 input    Potato
    Wait Until Page Contains    Row 2 was added    10s
    Wait Until Element Is Enabled    css=#row2 button[name="Save"]    10s
    Click Button    css=#row2 button[name="Save"]
    Page Should Contain    Row 2 was saved
    Close Browser


Change Disabled Text With Edit
    Open Browser    https://practicetestautomation.com/practice-test-exceptions/    chrome
    Click Button    id=edit_btn
    Clear Element Text    css=#row1 input
    Input Text    css=#row1 input    Potato
    Click Button    css=#row1 button[name="Save"]
    Page Should Contain    Row 1 was saved
    Close Browser

UI State Validatie
    [Documentation]    Verifies the login of a user.
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Sleep    5s
    Perform Valid Login
    Page Should Contain    Log out
    Page Should Contain    Logged In Successfully
    Page Should Contain    Congratulations student. You successfully logged in!
    Page Should Not Contain    Your username is invalid
    Location Should Contain    logged-in-successfully
    Element Should Not Be Visible    id=username
    Close Browser 

TimeoutException
    Open Browser    https://practicetestautomation.com/practice-test-exceptions/    chrome
    Click Button    id=add_btn
    Wait Until Element Is Visible    id=row2    2s
    Wait Until Element Is Enabled    id=row2    2s
    Close Browser

Add To Cart - SauceDemo
    [Documentation]    Adds multiple products to cart and opens the cart page
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Perform Valid Login SauceDemo
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-backpack    10s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Page Should Contain Element    id=remove-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Page Should Contain Element    id=remove-sauce-labs-bike-light
    Element Text Should Be    css=.shopping_cart_badge    2
    Click Element    css=.shopping_cart_link
    Page Should Contain    Your Cart
    Click Button    id=checkout
    Information Buyer
    Overview Checkout
    Element Text Should Be    css=[data-test="total-label"]    Total: $43.18
    Click Button    id=finish
    Page Should Contain    Thank you for your order!

*** Test Cases ***

*** Test Cases ***
Save Without Value Should Fail
    [Documentation]    Verifies validation when trying to save empty input
    Open Browser    https://practicetestautomation.com/practice-test-exceptions/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=row1    10s
    Click Button    id=add_btn
    Wait Until Element Is Visible    css=#row2 input    10s
    Click Button    css=#row2 button[name="Save"]
    Page Should Not Contain    Row 2 was saved
    Close Browser
#They built this wrong. The save button works when you have saved an empty field.

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Mobile Viewport Smoke Test
    [Documentation]    Verifies that login page renders correctly on mobile viewport
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome

    Set Window Size    375    667

    Wait Until Element Is Visible    id=username    10s
    Wait Until Element Is Visible    id=password    10s
    Wait Until Element Is Visible    id=submit      10s

    Page Should Contain    Test Login

    Close Browser

*** Test Cases ***
Mobile Login With Valid Credentials
    [Documentation]    Verifies valid login on mobile viewport
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Set Window Size    375    667

    Wait Until Element Is Visible    id=username    10s
    Perform Valid Login

    Page Should Contain    Logged In Successfully
    Location Should Contain    logged-in-successfully

    Close Browser

Mobile Browser Login With Invalid Username
    [Documentation]    Verifies invalid username login on mobile viewport
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Set Window Size    375    667

    Wait Until Element Is Visible    id=username    10s
    Perform Invalid Username

    Page Should Contain    Your username is invalid!

    Close Browser

Mobile Browser Login With Invalid Password
    [Documentation]    Verifies invalid password login on mobile viewport
    Open Browser    https://practicetestautomation.com/practice-test-login/    chrome
    Set Window Size    375    667

    Wait Until Element Is Visible    id=username    10s
    Perform Invalid Password

    Page Should Contain    Your password is invalid!

    Close Browser

Dropdown List
    Open Browser    https://the-internet.herokuapp.com/dropdown    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=dropdown
    Select From List By Label    id=dropdown    Option 2
    Close Browser

*** Test Cases ***
New Window Opening
    Open Browser    https://the-internet.herokuapp.com/windows    chrome
    Maximize Browser Window
    ${handles_before}=    Get Window Handles
    ${count_before}=      Get Length    ${handles_before}
    Click Link    Click Here
    Wait Until Keyword Succeeds    5s    500ms    Check Window Count Increased    ${count_before}
    Switch Window    NEW
    Wait Until Page Contains    New Window
    Close Browser
