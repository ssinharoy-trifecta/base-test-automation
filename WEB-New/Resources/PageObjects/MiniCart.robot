*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${closeMiniCartBtn}
${cartCheckoutBtn}      id = desktop-checkout-button
${quantityIncreaseBtn}  id = quantity-increase


*** Keywords ***
Click Checkout on Mini Cart
  Wait Until Element Is Enabled    ${cartCheckoutBtn}
  Click Button  ${cartCheckoutBtn}

Close MiniCart by clicking on X
  Click Button              ${closeMinicartBtn}