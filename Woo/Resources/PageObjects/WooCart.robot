*** Variables ***
${cartCheckoutBtn}    Checkout
${removeFromCartBtn}  id = cart-item-243704-cart-remove
${saveCartBtn}        Save

*** Keywords ***
Click Checkout
  Click Button  ${cartCheckoutBtn}

Remove Item From Cart
  Sleep          1s
  Click Button  ${removeFromCartBtn}       

Save Subscription Modify
  Click Button  ${saveCartBtn}
