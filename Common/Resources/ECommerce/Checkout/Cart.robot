*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${closeMinicartBtn}  id = btn-minicart-close
${checkoutBtn}       id = top-cart-btn-checkout

*** Keywords ***
Close Cart
  Sleep              1s
  Click Button       ${closeMinicartBtn}

Go To Checkout
  Click Button       ${checkoutBtn}
  Log                Continuing to checkout...