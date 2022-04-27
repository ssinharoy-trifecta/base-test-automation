*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${addToCartBtn}=            id = product-addtocart-button

*** Keywords ***
Add Product To Cart
  Sleep                     2s
  Click Button              ${addToCartBtn}
  Log                       Added products to cart...
