*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.
Resource          ${EXECDIR}/Resources//PageObjects/Cart.robot
Resource          ${EXECDIR}/Resources//PageObjects/ProductSelector.robot
Resource          ${EXECDIR}/Resources//PageObjects/TopNav.robot
Resource          ${EXECDIR}/Resources//PageObjects/ProductPage.robot
Resource          ${EXECDIR}/Resources//PageObjects/CustomerAccount.robot
Resource          ${EXECDIR}/Resources//PageObjects/CustomerCreate.robot
Resource          ${EXECDIR}/Resources//PageObjects/CustomerLogin.robot
Resource          ${EXECDIR}/Resources//PageObjects/ShopLandingPage.robot

*** Variables ***

*** Keywords ***
Go To Checkout With A Valid Cart
  Navigate To Product Selector
  Select Category And Go To Specific Product Page
  Repeat Keyword  10  Add Product To Cart
  Go To Checkout

Create A New Account
  Navigate To Account Redirects
  Click Create An Account Button
  Complete New Customer Form

Logout From My Account
  Click Log Out

Login
  Navigate To Account Redirects
  Login As Registered Customer