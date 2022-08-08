*** Variables ***
${cartCheckoutBtn}    Checkout
${saveCartBtn}        Save

*** Keywords ***
Click Checkout
  Click Button  ${cartCheckoutBtn} 

Save Subscription Modify
  Click Button  ${saveCartBtn}
