*** Settings ***
Documentation       
...   This is a sample series of tests that validates the TestRail.Robot file.
...   The TestRail.robot is called by Common to gather results during Test Teardown.
...   These must post to a global variable housed by Common.  Once complete, the
...   Suite Teardown posts the contents to TestRail.  
...   Suite Teardown requires a TestSuiteID be passed in as a parameter or it will
...   skip the post to TestRail.
...   The tests below can be commented out to or uncommented to provide either a pass
...   or fail result.  Valid Test Runs can be swapped out between:
...   * #321 - https://trifectatest.testrail.com/index.php?/runs/view/321
...   * #326 - https://trifectatest.testrail.com/index.php?/runs/view/326
Resource            ../../Resources/Common.robot
Resource            ../../Resources/CustomerController.robot
Test Setup          Common.Begin Browser Test  ${MAGENTO_SHOP_HOME}  ${runlocal}
Test Teardown       Common.End Browser Test
Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   ${testSuiteID}

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
# Test 1 - Fail
#   ## ***The following item gives a Fail result***
#   [Tags]                              Smoke   Luma    testcaseid=8696
#   CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}

Test 1 - Pass
  # ***The following items give a Pass result***
  [Tags]                              Smoke   Luma    testcaseid=8696
  IF    '${testSuiteID}' != 'SkipMe'
    TestRail.Return Test Suite From TestRail  ${testSuiteID}  7
  ELSE
    Log   No TestSuiteID Supplied
  END


Test 2 - Fail, no TestRail post
  ## ***The following item gives a Fail result with nothing logged to TestRail***
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}

# Test 2 - Pass, no TestRail post
#   # ***The following items give a Pass result***
#   IF    '${testSuiteID}' != 'SkipMe'
#     TestRail.Return Test Suite From TestRail  ${testSuiteID}  7
#   ELSE
#     Log   No TestSuiteID Supplied
#   END

Test 3 - Fail
  [Tags]                              Smoke   Luma    testcaseid=8697
  ## ***The following item gives a Fail result***
  CustomerController.Go To Checkout With A Valid Cart    ${customerInfo}

# Test 3 - Pass
#   [Tags]                              Smoke   Luma    testcaseid=8697
#   # ***The following items give a Pass result***
#   IF    '${testSuiteID}' != 'SkipMe'
#     TestRail.Return Test Suite From TestRail  ${testSuiteID}  7
#   ELSE
#     Log   No TestSuiteID Supplied
#   END

Get Single Test Case from TestRail
  TestRail.Return Test Case From TestRail   8697

Get Test Suite from TestRail
  IF    '${testSuiteID}' != 'SkipMe'
    TestRail.Return Test Suite From TestRail  ${testSuiteID}  7
  ELSE
    Log   No TestSuiteID Supplied
  END
