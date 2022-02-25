*** Settings ***
Documentation     Common Keywords and Variables to be used across all customer flow features.
Resource          ./PageObjects/Cart.robot
Resource          ./PageObjects/ProductSelector.robot
Resource          ./PageObjects/TopNav.robot
Resource          ./PageObjects/ProductPage.robot


*** Variables ***

*** Keywords ***
User Can Get To Checkout With A Valid Cart
  Navigate To Product Selector
  Select Category And Go To Specific Product Page
  Repeat Keyword  10  Add Product To Cart
  Go To Checkout