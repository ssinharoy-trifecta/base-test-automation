*** Settings ***
Documentation   Common Keywords and Variables to be used across all customer flow features.
Resource        ./PageObjects/Cart.robot
Resource        ./PageObjects/ProductSelector.robot
Resource        ./PageObjects/TopNav.robot
Resource        ./PageObjects/ProductPage.robot


*** Variables ***
${index}=  1

*** Keywords ***
User can get to checkout with a valid cart
  Navigate_To_Product_Selector
  Select_Category_And_Go_To_Specific_Product_Page
  Repeat Keyword  10  Add_Product_To_Cart
  Go_To_Checkout