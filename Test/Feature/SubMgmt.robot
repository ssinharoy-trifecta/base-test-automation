*** Settings ***
Documentation   These tests will cover general product catalog, subscription and coupon management use cases.
Resource        ../../Resources/Common.robot
Resource        ../../Resources/CustomerController.robot

# robot -d results test/Feature/SubMgmt.robot

*** Variables ***
${URL} =  https://test-magento-app-trifecta-qa1.trifecta.dev
${BROWSER} =  chrome

*** Test Cases ***
Customer can get to checkout
  [Documentation]  Customer can add items to cart and proceed to checkout.
  [Tags]  Smoke
  # Open Browser
  Begin Maximize Browser Test
  User can get to checkout with a valid cart
  # Close Browser
  End Browser Test

