*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.
Resource                        ./PageObjects/Cart.robot
Resource                        ./PageObjects/ProductSelector.robot
Resource                        ./PageObjects/TopNav.robot
Resource                        ./PageObjects/ProductPage.robot
Resource                        ./PageObjects/CustomerAccount.robot
Resource                        ./PageObjects/CustomerCreate.robot
Resource                        ./PageObjects/CustomerLogin.robot
Resource                        ./PageObjects/ShopLandingPage.robot

*** Variables ***
${emailAddress}

*** Keywords ***
Go To Checkout With A Valid Cart
  Navigate To Product Selector
  Select Category And Go To Specific Product Page
  Repeat Keyword                10                  Add Product To Cart
  Go To Checkout

Create A New Account
  [Arguments]                   ${firstName}        ${lastName}   ${password}
  #TODO: Do we need to return the eMail address here?
  Navigate To Account Redirects
  Click Create An Account Button
  ${emailAddress}               Complete New Customer Form 
  ...   ${firstName}            ${lastName}         ${password}
  [Return]                      ${emailAddress}

Logout From My Account
  Click Log Out

Login
  [Arguments]                  ${CREATED_EMAIL}    ${password}
  Navigate To Account Redirects
  Login As Registered Customer  ${CREATED_EMAIL}    ${password}