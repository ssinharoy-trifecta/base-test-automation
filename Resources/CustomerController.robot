*** Settings ***
Documentation   Common Keywords and Variables to be used across all customer flow features.
Library         SeleniumLibrary
Resource        ./PageObjects/Cart.robot
Resource        ./PageObjects/ProductSelector.robot
Resource        ./PageObjects/TopNav.robot
Resource        ./PageObjects/ProductPage.robot


*** Variables ***

*** Keywords ***
User can get to checkout with a valid cart
  Log  Going to Product Selector from header button...
  Navigate to ProductSelector
  Select category and go to specific product page
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Add product to cart
  Close cart
  Log  Added products to cart and continuing to checkout...
  Go to checkout