*** Variables ***
${cartCheckoutBtn}    Checkout
${removeFromCartBtn}  xpath = //*[@id="cart-item-105521-cart-remove"]/span
${saveCartBtn}        Save

*** Keywords ***
Click Checkout
  Click Button  ${cartCheckoutBtn}

Remove Item From Cart
  Click Element  ${removeFromCartBtn}       

Save Subscription Modify
  Click Button  ${saveCartBtn}
