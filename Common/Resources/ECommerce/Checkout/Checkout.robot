*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${checkoutValidationTxt}        Shipping Address

*** Keywords ***
Validate Checkout Page As New Customer
    Wait Until Page Contains    ${checkoutValidationTxt}
