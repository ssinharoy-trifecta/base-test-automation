*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.
Resource          Authentication/CustomerCreate.robot
Resource          Authentication/CustomerLogin.robot
Resource          Authentication/Account/CustomerAccount.robot
Resource          ECommerce/TopNav.robot
Resource          ECommerce/Catalog/ProductPage.robot
Resource          ECommerce/Catalog/ProductSelector.robot
Resource          ECommerce/Catalog/ShopLandingPage.robot
Resource          ECommerce/Checkout/Cart.robot

*** Variables ***

*** Keywords ***
Go To Checkout With A Valid Cart
  Navigate To Product Selector
  Select Category And Go To Specific Product Page
  Repeat Keyword                10                Add Product To Cart
  Go To Checkout

Create A New Account
  [Arguments]                   ${firstName}      ${lastName}   ${testCaseEmail}   ${password}
  Navigate To Account Redirects
  Click Create An Account Button
  Complete New Customer Form    ${firstName}      ${lastName}   ${testCaseEmail}   ${password}

Logout From My Account
  Click Log Out

Login
  [Arguments]                   ${testCaseEmail}   ${password}
  Navigate To Account Redirects
  Login As Registered Customer  ${testCaseEmail}   ${password}