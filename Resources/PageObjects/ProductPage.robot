*** Settings ***
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***
Add product to cart
  Wait until page contains  Build your meal plan
  Click button  id = product-addtocart-button
  Sleep  2s

Add multiple items to the cart  
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s
  Click button  id = product-addtocart-button
  Sleep  2s