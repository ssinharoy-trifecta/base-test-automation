*** Settings ***
Library                     SeleniumLibrary
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
${testCaseEmail}          selenium+03-15-22.12.47.04.1647373624@trifectanutrition.com
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
1.1 - Non logged in customers must be able to register and create a new account from the My Account link in the header
  [Documentation]
  ...   Customer can create a new account successfully. Uses TRI Theme.
  ...   This will generate a new eMail if it's not passed in at the command line
  [Tags]                  Auth    TRI   Smoke   testcaseid=16873
  ${customerInfo}=        CustomerController.Create A New Account    ${customerInfo}
  CustomerController.Logout From My Account
  CustomerController.Login                   ${customerInfo}
  CustomerController.Logout From My Account

1.12 - Customers must be able to login to their account with email and password credentials
  [Documentation]
  ...   Customer can login as a previously created user.  Can be overridden 
  ...   at the CommandLine. Uses TRI Theme.
  [Tags]    Auth    TRI   Smoke   testcaseid=16794
  CustomerController.Login     ${customerInfo}
  CustomerController.Logout From My Account

