*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${addToCartBtn}=            id = product-addtocart-button

*** Keywords ***
Add Product To Cart
  Wait Until Page Contains  Build your meal plan
  Click Button              ${addToCartBtn}
  Log                       Added products to cart...
  Sleep                     2s