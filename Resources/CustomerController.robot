*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.
Resource          ./PageObjects/Cart.robot
Resource          ./PageObjects/ProductSelector.robot
Resource          ./PageObjects/TopNav.robot
Resource          ./PageObjects/ProductPage.robot
Resource          ./PageObjects/CustomerAccount.robot
Resource          ./PageObjects/CustomerCreate.robot
Resource          ./PageObjects/CustomerLogin.robot
Resource          ./PageObjects/ShopLandingPage.robot

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