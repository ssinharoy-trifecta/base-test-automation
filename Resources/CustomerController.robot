*** Settings ***
Documentation   Common Keywords and Variables to be used across all customer flow features.
Resource        ./PageObjects/Cart.robot
Resource        ./PageObjects/ProductSelector.robot
Resource        ./PageObjects/TopNav.robot
Resource        ./PageObjects/ProductPage.robot


*** Variables ***
@{max}=  1  2  3  4  5  6  7
${index}=  Set Variable  1

*** Keywords ***
User can get to checkout with a valid cart
  Navigate_To_Product_Selector
  Select_Category_And_Go_To_Specific_Product_Page
  #Loops adding products
  FOR  ${index}  IN  @{max}
    Log  ${index}
    Add_Product_To_Cart  
    Exit For Loop If    ${index} == @{max}
    Close_Cart
    ${index}=    Evaluate    ${index} + 1
  END
  #End Loop
  Go_To_Checkout