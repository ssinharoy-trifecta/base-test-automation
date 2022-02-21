*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${minicartBtn}  id = btn-minicart-close
${checkoutBtn}  id = top-cart-btn-checkout

*** Keywords ***
Close_Cart
  sleep  1s
  click button  ${minicartBtn}

Go_To_Checkout
  Click button  ${checkoutBtn}
  Log  Continuing to checkout...