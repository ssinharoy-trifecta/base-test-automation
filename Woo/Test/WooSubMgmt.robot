*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../Common/Resources/Common.robot
Resource            ../Resources/Controllers/WooCustController.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   ${testRunID}
Test Setup          Common.Begin Browser Test
...                 ${WOOCOMMERCE_SHOP_HOME}
...                 ${runlocal}
...                 ${configBS}
Test Teardown       Common.End Browser Test

*** Variables ***

*** Test Cases ***
#This is a test test case and will be replaced in following story.
Test Purchase A Meal Plan
  WooCustController.Add A Single Meal Plan To Cart
  WooCustController.Continue To Checkout
  WooCustController.Complete Checkout Forms
  WooCustController.Complete Checkout Transaction

#Test Purchase The Budget Bundle

#Test Purchase An A La Carte Subscription

#Test Checkout Using Hubspot Link
