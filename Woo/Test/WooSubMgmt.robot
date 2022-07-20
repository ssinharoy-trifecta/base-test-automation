*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
...   The `Test Setup` and `Test Teardown` allows the script to create a new browser and close that
...   browser each time a Test Case(below) is run.  It takes a keyword or a direct command to open
...   a browser with a location to navigate to.  This can be overridden at the individual test
...   case level to change the parameters set in the Settings section here.  Using the [Setup] and
...   [Teardown] blocks inside the Test Case allows those items to be be overridden.
...   Command Line Parameters:
...   - Environment: `-v env:qa-1`
...   - Browser: `-v browser:ff`
...   - Existing User Login: `-v testCaseEmail:overriddenEmailAddress@trifectanutrition.com`
...   - Existing User Password: `-v password:OverRiddenPa$$word123`
...   - Results Directory: `-d Results`
...   - Include Tags: `-i Checkout`
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
