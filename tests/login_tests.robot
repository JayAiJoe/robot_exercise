*** Settings ***
Documentation    A test suite for test cases involving logins.
...
...              This test has a workflow that is created using keywords in
...              the SeleniumLibrary.
Library          SeleniumLibrary   
Resource         resources.robot

*** Test Cases ***
Valid Login
    Login To Standard Inventory
    Element Attribute Value Should Be    xpath://*[@id="item_4_img_link"]/img    src    ${LOGIN URL}static/media/sauce-backpack-1200x1500.34e7aa42.jpg
    [Teardown]    Close Browser

Locked Out User
    Open Browser To Login Page
    Input Text    user-name    locked_out_user
    Input Password    password    ${PASSWORD}
    Click Button    login-button
    Element Text Should Be    css:*[data-test="error"]    Epic sadface: Sorry, this user has been locked out.
    [Teardown]    Close Browser

Problem User
    Open Browser To Login Page
    Input Text    user-name    problem_user
    Input Password    password    ${PASSWORD}
    Click Button    login-button
    Element Attribute Value Should Be    xpath://*[@id="item_4_img_link"]/img    src    ${LOGIN URL}static/media/sl-404.168b1cce.jpg
    [Teardown]    Close Browser

Wrong Password
    Open Browser To Login Page
    Input Text    user-name    ${STANDARD USER}
    Input Password    password    just_sauce
    Click Button    login-button
    Element Text Should Be    css:*[data-test="error"]    Epic sadface: Username and password do not match any user in this service
    [Teardown]    Close Browser