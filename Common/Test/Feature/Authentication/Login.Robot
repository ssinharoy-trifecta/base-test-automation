*** Settings ***
Library             SeleniumLibrary
Resource            ../../../Resources/Common.robot
Resource            ../../../Resources/CustomerController.robot
Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   ${testRunID}
Test Setup          Common.Begin Browser Test
...                 ${MAGENTO_SHOP_HOME}
...                 ${runlocal}
...                 ${configBS}
Test Teardown       Common.End Browser Test

*** Variables ***
${testCaseEmail}          selenium+default@trifectanutrition.com
${firstName}              Elden
${lastName}               Ring
${password}               tester123!
#Customer list variable
&{customerInfo}
...                       firstName=${firstName}
...                       lastName=${lastName}
...                       email=${testCaseEmail}
...                       password=${password}

*** Test Cases ***
Test 1.1 - User can register for a new account from the My Account link
  [Documentation]
  ...   TestRail case name: "1.1 - Non logged in customers must be able to register
  ...       and create a newaccount from the My Account link in the header"
  ...   Customer can create a new account successfully. Uses TRI Theme.
  ...   This will generate a new eMail if it's not passed in at the command line
  [Tags]                      Auth  TRI   Smoke   testcaseid=16783  1.1
  ${customerInfo}=            CustomerController.Create A New Account    ${customerInfo}
  CustomerController.Logout From My Account
  CustomerController.Login    ${customerInfo}
  CustomerController.Logout From My Account

Test 1.12 - Customers can login to their account with email and password
  [Documentation]
  ...   TestRail Case Name: "1.12 - Customers must be able to login to their account
  ...       with email and password credentials"
  ...   Customer can login as a previously created user.  Can be overridden
  ...   at the CommandLine. Uses TRI Theme.
  [Tags]                       Auth   TRI  Smoke  testcaseid=16794  1.12
  CustomerController.Login     ${customerInfo}
  CustomerController.Logout From My Account

