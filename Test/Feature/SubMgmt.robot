*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
Resource            ../../Resources/Common.robot
Resource            ../../Resources/CustomerController.robot
Suite Setup         Initialize Global Variables
Test Setup          Begin Browser Test    ${MAGENTO_SHOP_HOME}
Test Teardown       End Browser Test

*** Variables ***

*** Test Cases ***
Test Customer Can Get To Checkout
  [Documentation]
  ...   Customer can add items to cart and proceed to checkout.
  [Tags]            Smoke
  Begin Maximize Browser Test
  Go To Checkout With A Valid Cart

Test Customer Can Create Account And Logout
  [Documentation]
  ...   Customer can create a new account successfully.
  [Tags]            Auth  Smoke
  Create A New Account
  Logout From My Account

Test Customer Can Login
  [Documentation]
  ...   Customer can login as a previously created user.
  [Tags]            Auth  Smoke
  Login
