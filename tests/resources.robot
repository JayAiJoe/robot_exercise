*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              Creating system specific keywords from default keywords from
...              the SeleniumLibrary.
Library          SeleniumLibrary   

*** Variables ***
${SERVER}    www.saucedemo.com
${BROWSER}    chrome
${STANDARD USER}    standard_user
${PASSWORD}    secret_sauce

${LOGIN URL}    https://${SERVER}/
${INVENTORY URL}    https://${SERVER}/inventory.html

${SORT OPTIONS}    css:select.product_sort_container[data-test="product_sort_container"]
${FIRST INVENTORY}    xpath://*[@id="inventory_container"]/div/div[1]/div[1]/a
${LAST INVENTORY}    xpath://*[@id="inventory_container"]/div/div[6]/div[1]/a


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Page Should Contain Element    login-button

Login To Standard Inventory
    Open Browser To Login Page
    Input Text    user-name    ${STANDARD USER}
    Input Password    password    ${PASSWORD}
    Click Button    login-button
    Element Text Should Be    class:title    PRODUCTS