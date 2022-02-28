*** Settings ***
Documentation      These tests will cover general product catalog, subscription and coupon management use cases.
Resource           ../../Resources/Common.robot
Resource           ../../Resources/CustomerController.robot

# robot -d results test/Feature/SubMgmt.robot

*** Variables ***
${URL} =           https://test-magento-app-trifecta-qa1.trifecta.dev
${BROWSER} =       chrome

*** Test Cases ***
Customer Can Get To Checkout
  [Documentation]  Customer can add items to cart and proceed to checkout.
  [Tags]           Smoke
  # Open Browser
  Begin Maximize Browser Test
  User Can Get To Checkout With A Valid Cart
  # Close Browser
  End Browser Test

Customer Can Create Account And Logout
  [Documentation]  Customer can create a new account successfully.
  [Tags]           Auth  Smoke
  # Open Browser
  Begin Browser Test
  User Can Create A New Account
  Logout From My Account
  # Close Browser
  End Browser Test

Customer Can Login
  [Documentation]  Customer can login as a previously created user.
  [Tags]           Auth  Smoke
  # Open Browser
  Begin Browser Test
  User Can Login
  # Close Browser
  End Browser Test

