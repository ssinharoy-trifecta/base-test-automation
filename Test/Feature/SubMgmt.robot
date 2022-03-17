*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
...   The `Test Setup` and `Test Teardown` allows the script to create a new browser and close that
...   browser each time a Test Case(below) is run.  It takes a keyword or a direct command to open 
...   a browser with a location to navigate to.  This can be overridden at the individual test 
...   case level to change the parameters set in the Settings section here.  Using the [Setup] and
...   [Teardown] blocks inside the Test Case allows those items to be be overridden. 
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser 
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../Resources/Common.robot
Resource            ../../Resources/CustomerController.robot
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
