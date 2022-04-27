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

*** Keywords ***
Go To Checkout With A Valid Cart
  [Arguments]                                  ${customerInfo}
  ProductSelector.Select Category And Go To Specific Product Page
  Repeat Keyword                               5                 ProductPage.Add Product To Cart
  Cart.Open Minicart
  Cart.Go To Checkout
  CustomerCreate.Create An Account From OverLay
  CustomerCreate.Complete New Customer Form    ${customerInfo}
  Checkout.Validate Checkout Page As New Customer

Create A New Account
  [Arguments]         ${customerInfo}
  TopNav.Navigate To Account Redirects
  CustomerLogin.Click Create An Account Button
  ${customerInfo}=    CustomerCreate.Complete New Customer Form    ${customerInfo}
  CustomerAccount.Validate My Account Page
  [Return]            ${customerInfo}

Logout From My Account
  CustomerAccount.Click Log Out

Login
  [Arguments]                                 ${customerInfo}
  TopNav.Navigate To Account Redirects
  CustomerLogin.Login As Registered Customer  ${customerInfo}
