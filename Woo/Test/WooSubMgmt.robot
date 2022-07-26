*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../Common/Resources/Common.robot
Resource            ../Resources/Controllers/WooCustController.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   
...                 ${testRunID}
...                 ${envPath}
Test Setup          Common.Begin Browser Test
...                 ${WOOCOMMERCE_SHOP_HOME}
...                 ${runlocal}
...                 ${configBS}
...                 ${envPath}
Test Teardown       Common.End Browser Test

*** Variables ***

*** Test Cases ***
Test Purchase A Meal Plan
  [Tags]  Smoke  Checkout  testcaseid=8696
  WooCustController.Add A Single Meal Plan To Cart
  WooCustController.Complete Checkout From Product Selector

Test Purchase The Budget Bundle
  [Tags]  Smoke  Checkout  testcaseid=8706
  Go To  ${hsBundleParams}
  WooProductSelector.Validate Product Selector Page Load
  WooCustController.Complete Checkout From Product Selector

Test Purchase An A La Carte Subscription
  [Tags]  Smoke  Checkout  testcaseid=8708
  WooCustController.Add A La Carte To Cart
  WooCustController.Complete Checkout From Product Selector

Test Checkout Using Hubspot Link
  [Tags]  Smoke  Checkout  testcaseid=7101
  Go To  ${hsMealPlanParams}
  WooCustController.Complete Checkout
  