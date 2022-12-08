*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${addToCartBtn}     id = variation-add-to-cart


*** Keywords ***
Add Meal Plan to Cart
    Wait Until Element Is Enabled    ${addToCartBtn}
    Run Keyword and Ignore Error    Scroll Element Into View    ${addToCartBtn}
    Click Button    ${addToCartBtn}

Add a Meal Prep item to Cart

Add a Classics item to Cart
Add a Gift Card item to Cart

