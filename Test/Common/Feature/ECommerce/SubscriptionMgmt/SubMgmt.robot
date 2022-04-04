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
# TODO: Additional discussion how `Test Setup`, `Begin Browser Test` and `Begin Maximize Browser 
# Test` are implemented. For example, should all tests be run at 1920 x 1024px browser size?
# If so, these two keywords can be merged or should they remain standalone

Resource            ../../../../../Resources/Common/Common.robot
Resource            ../../../../../Resources/Common/CustomerController.robot
Resource            ../../../../../Resources/Common/Authentication/CustomerCreate.robot
Resource            ../../../../../Resources/Common/Integrations/Browserstack.robot
Test Setup          Setup Browserstack  ${MAGENTO_SHOP_HOME}
Test Teardown       End Browser Test

*** Variables ***
${testCaseEmail}          selenium+03-15-22.12.47.04.1647373624@trifectanutrition.com
${firstName}              Elden
${lastName}               Ring
${password}               tester123!

*** Test Cases ***
Test Customer Can Get To Checkout
  [Documentation]
  ...   Customer can add items to cart and proceed to checkout.
  [Tags]                  Smoke
  Go To Checkout With A Valid Cart

Test Customer Can Create Account And Logout
  [Documentation]
  ...   Customer can create a new account successfully.
  [Tags]                  Auth                  Smoke
  # Generate a new user and eMail account for the test case it not passed in
  IF    '${testCaseEmail}' == 'selenium+03-15-22.12.47.04.1647373624@trifectanutrition.com'
          ${testCaseEmail} =    Generate New eMail Address
          Log                   ${testCaseEmail}
  END
  Create A New Account
  ...   ${firstName}      ${lastName}
  ...   ${testCaseEmail}  ${password}
  Logout From My Account
  # Log back in as the newly created user
  Login                   ${testCaseEmail}      ${password}
  Logout From My Account

Test Customer Can Login
  [Documentation]
  ...   Customer can login as a previously created user.  Can be overridden 
  ...   at the CommandLine
  [Tags]                  Auth                  Smoke
  Login                   ${testCaseEmail}      ${password}