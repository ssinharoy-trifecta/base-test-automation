*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${addToCartBtn}=  id = product-addtocart-button

*** Keywords ***
Add_Product_To_Cart
  Wait until page contains  Build your meal plan
  Click button  ${addToCartBtn}
  Log  Added products to cart...
  Sleep  2s