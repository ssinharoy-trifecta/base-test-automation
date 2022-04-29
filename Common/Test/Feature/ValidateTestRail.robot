*** Settings ***
Resource            ../../Resources/Common.robot
Resource            ../../Resources/CustomerController.robot
Test Setup          Common.Begin Browser Test  ${MAGENTO_SHOP_HOME}  ${runlocal}
Test Teardown       Common.End Browser Test
Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test

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
Test 1
  [Tags]                              Smoke   Luma    testcaseid=16784
  #Begin Maximize Browser Test
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}

Test 2
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}

Test 3
  [Tags]                              Smoke   Luma    testcaseid=16785
  #Begin Maximize Browser Test
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}
