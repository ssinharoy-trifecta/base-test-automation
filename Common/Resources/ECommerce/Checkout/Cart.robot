*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${closeMinicartBtn}   id = btn-minicart-close
${checkoutBtn}        Proceed to Checkout
${cartBtn}            xpath=//*[@id="html-body"]/div[2]/header/div[2]/div[1]/a
${cartTxt}            Cart Subtotal

*** Keywords ***
Close Cart
  Wait Until Page Contains  ${closeMinicartBtn}
  Click Button              ${closeMinicartBtn}

Go To Checkout
  Wait Until Page Contains  ${checkoutBtn}
  Click button              ${checkoutBtn}
  Sleep                     2s

Open Minicart
  Click Element             ${cartBtn} 
  Wait Until Page Contains  ${cartTxt}
