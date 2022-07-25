*** Settings ***
Documentation
...   These tests will cover general product catalog, subscription and coupon management use cases.
...   The `Test Setup` and `Test Teardown` allows the script to create a new browser and close that
...   browser each time a Test Case(below) is run.  It takes a keyword or a direct command to open
...   a browser with a location to navigate to.  This can be overridden at the individual test
...   case level to change the parameters set in the Settings section here.  Using the [Setup] and
...   [Teardown] blocks inside the Test Case allows those items to be be overridden.
...   Command Line Parameters:
...   - Environment: `-v env:qa1`
...   - Browser: `-v browser:ff`
...   - Existing User Login: `-v testCaseEmail:overriddenEmailAddress@trifectanutrition.com`
...   - Existing User Password: `-v password:OverRiddenPa$$word123`
...   - Results Directory: `-d Results`
...   - Include Tags: `-i Luma`
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../../../Resources/Common.robot
Resource            ../../../../Resources/CustomerController.robot
Resource            ../../../../Resources/Authentication/CustomerCreate.robot
Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test
...                 ${testRunID}
...                 ${envPath}
Test Setup          Common.Begin Browser Test
...                 ${MAGENTO_SHOP_HOME}
...                 ${runlocal}
...                 ${configBS}
...                 ${envPath}
Test Teardown       Common.End Browser Test

*** Variables ***
${testCaseEmail}  selenium+default@trifectanutrition.com
${firstName}      Elden
${lastName}       Ring
${password}       tester123!
#Customer list variable
&{customerInfo}
...               firstName=${firstName}
...               lastName=${lastName}
...               email=${testCaseEmail}
...               password=${password}

*** Test Cases ***
Test 1.2 Non-Logged In User Can Create Account From Checkout
  [Documentation]
  ...   TestRail case name: "1.2 Non-Logged In User Must Be Able To Create Account
  ...       From Checkout"
  ...   Customer can add items to cart and proceed to checkout. Uses Luma Theme.
  [Tags]    Smoke   Luma  testcaseid=16784  1.2
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}
