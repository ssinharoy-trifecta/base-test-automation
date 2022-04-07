*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${addToCartBtn}=            id = product-addtocart-button
${productPrice}=            22.80

*** Keywords ***
Add Product To Cart
  Wait Until Page Contains  ${productPrice}
  Click Button              ${addToCartBtn}
  Log                       Added products to cart...
  Sleep                     2s
