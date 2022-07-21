*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../Common/Resources/Common.robot
Resource            ../../Common/Resources/CustomerController.robot

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
Test Sleep Sleep Baby
  Sleep  2s
