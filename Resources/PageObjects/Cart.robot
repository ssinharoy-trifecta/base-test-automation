*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${minicartBtn}  id = btn-minicart-close
${checkoutBtn}  id = top-cart-btn-checkout
${plusQtyBtn}  xpath = //*[@id="mini-cart"]/li/div/div[2]/div[1]/span[2]

*** Keywords ***
Close_Cart
  sleep  1s
  click button  ${minicartBtn}

Go_To_Checkout
  Click button  ${checkoutBtn}
  Log  Continuing to checkout...