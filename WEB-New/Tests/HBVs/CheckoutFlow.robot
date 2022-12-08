*** Settings ***
Resource    ../../../WEB-New/Resources/Settings.robot

#We need a set of tests that confirm that the checkout process is working.
*** Test Cases ***
New Customer checks out with a Meal Plan Item
    [Tags]  HBV
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    Sleep  5s
    TopNav.Navigate to Meal Plans Product Selector Page
    ProductSelector.Click on a Paleo Meal Plan Product Card Title
    ProductDetail.Add Meal Plan to Cart
    MiniCart.Click Checkout on Mini Cart

New Customer checks out with a Meal Prep Item
    [Tags]  HBV
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    Sleep  5s
    TopNav.Navigate to Meal Prep Product Selector Page
    ProductSelector.Click on a Paleo Meal Plan Product Card Title
    ProductDetail.Add Meal Plan to Cart
    MiniCart.Click Checkout on Mini Cart

New Customer checks out with a Meal Plan Item and uses Coupon
    [Tags]  HBV
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    Sleep  5s
    TopNav.Navigate to Meal Plans Product Selector Page
    ProductSelector.Click on Paleo Meal Plan Product Card Title
    ProductDetail.Add Meal Plan to Cart
    MiniCart.Click Checkout on Mini Cart

#New Customer checks out with a Meal Plan and Meal Prep Item
    [Tags]  HBV
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    Sleep  5s
    TopNav.Navigate to Meal Plans Product Selector Page
    ProductSelector.Click on Paleo Meal Plan Product Card Title
    ProductDetail.Add Meal Plan to Cart
    MiniCart.Click Checkout on Mini Cart
    TopNav.Navigate to Meal Prep Product Selector Page
    ProductSelector.Click on Paleo Meal Plan Product Card Title
    ProductDetail.Add Meal Plan to Cart
    MiniCart.Click Checkout on Mini Cart

#Existing Customer modifies their Meal Plan Subscription


#Existing Customer modifies their Meal Prep Subscription
