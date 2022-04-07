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
Resource          ECommerce/Checkout/Checkout.robot

*** Variables ***

*** Keywords ***
Go To Checkout With A Valid Cart
  [Arguments]                                  ${firstName}      ${lastName}   
  ...                                          ${testCaseEmail}  ${password}
  ProductSelector.Select Category And Go To Specific Product Page
  Repeat Keyword                               5                 ProductPage.Add Product To Cart
  Cart.Open Minicart
  Cart.Go To Checkout
  CustomerCreate.Create An Account From OverLay
  CustomerCreate.Complete New Customer Form    ${firstName}      ${lastName}   
  ...                                          ${testCaseEmail}  ${password}
  Checkout.Validate Checkout Page As New Customer

Create A New Account
  [Arguments]                                  ${firstName}      ${lastName}   
  ...                                          ${testCaseEmail}  ${password}
  TopNav.Navigate To Account Redirects
  CustomerLogin.Click Create An Account Button
  CustomerCreate.Complete New Customer Form    ${firstName}      ${lastName}   
  ...                                          ${testCaseEmail}  ${password}
  CustomerAccount.Validate My Account Page

Logout From My Account
  Click Log Out

Login
  [Arguments]                                 ${testCaseEmail}   ${password}
  TopNav.Navigate To Account Redirects
  CustomerLogin.Login As Registered Customer  ${testCaseEmail}   ${password}
