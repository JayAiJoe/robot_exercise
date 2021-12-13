*** Settings ***
Documentation    A test suite for test cases involving product sorting.
...
...              This test has a workflow that is created using keywords in
...              the SeleniumLibrary.
Library          SeleniumLibrary
Resource         resources.robot   

*** Test Cases ***
Sort Name A To Z
    Login To Standard Inventory
    Select From List By Value    ${SORT OPTIONS}    az
    #first item is item_4_img_link
    Element Attribute Value Should Be    ${FIRST INVENTORY}    id    item_4_img_link
    #last item is item_3_img_link
    Element Attribute Value Should Be    ${LAST INVENTORY}    id    item_3_img_link
    [Teardown]    Close Browser

Sort Name Z To A
    Login To Standard Inventory
    Select From List By Value    ${SORT OPTIONS}    za
    #first item is item_3_img_link
    Element Attribute Value Should Be    ${FIRST INVENTORY}    id    item_3_img_link
    #last item is item_4_img_link
    Element Attribute Value Should Be    ${LAST INVENTORY}    id    item_4_img_link
    [Teardown]    Close Browser

Sort Price Low To High
    Login To Standard Inventory
    Select From List By Value    ${SORT OPTIONS}    lohi
    #first item is item_2_img_link
    Element Attribute Value Should Be    ${FIRST INVENTORY}    id    item_2_img_link
    #last item is item_5_img_link
    Element Attribute Value Should Be    ${LAST INVENTORY}    id    item_5_img_link
    [Teardown]    Close Browser

Sort Price High To Low
    Login To Standard Inventory
    Select From List By Value    ${SORT OPTIONS}    hilo
    #first item is item_5_img_link
    Element Attribute Value Should Be    ${FIRST INVENTORY}    id    item_5_img_link
    #last item is item_2_img_link
    Element Attribute Value Should Be    ${LAST INVENTORY}    id    item_2_img_link
    [Teardown]    Close Browser