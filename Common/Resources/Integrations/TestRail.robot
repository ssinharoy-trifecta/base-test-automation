*** Settings ***
Library     String
Library     Collections
Resource    API.robot
Variables   ../TestRailLibraries/testrail_env.py
Documentation
...    You'll need to update the testrail_env.py file with the TestRail User, password, and API Key
...    This is found in LastPass

*** Variables ***
${baseURL}              ${TESTRAIL_URL}
${singleCaseGet}        ${baseURL}index.php?/api/v2/get_case/
${multiCaseGet}         ${baseURL}index.php?/api/v2/get_cases/
${singleCasePost}       ${baseURL}index.php?/api/v2/add_result_for_case/
${multiCasePost}        ${baseURL}index.php?/api/v2/add_results_for_cases/
&{headers}              Authorization=Basic
...                     Content-Type=application/json
...                     accept=application/json
@{authData}             ${TESTRAIL_USER}
...                     ${TESTRAIL_APIKEY}
&{sessionDict}          url=${baseURL}
...                     headers=${headers}
...                     auth=@{authData}
${testCaseID}
${testProjectID}        7       # Test Project: https://trifectatest.testrail.com/index.php?/projects/overview/7
${testSuiteID}          60      # Test Suite: https://trifectatest.testrail.com/index.php?/suites/view/60
${testRunID}            SkipMe
${testCasePassStatus}   1       # TestRail API Pass Status Code
${testCaseFailStatus}   5       # TestRail API Fail Status Code
${emptyListSize}        4       # The size of an empty list, `[  ]`, is 4 chars
${testCaseTagSize}      11      # Accounts for `testcaseid=` which is 11 chars

*** Keywords ***
Return Test Case From TestRail
  [Arguments]             ${testCaseID}
  ${returnedResponse}=    API.GET Request And Fetch Status Code
  ...                     ${sessionDict}
  ...                     ${singleCaseGet}${testCaseID}
  Log                     ${returnedResponse}
  [Return]                ${returnedResponse}

Return Test Suite From TestRail
  ${returnedResponse}=    API.GET Request And Fetch Status Code
  ...                     ${sessionDict}
  ...                     ${multiCaseGet}${testProjectID}&suite_id=${testSuiteID}
  Log                     ${returnedResponse}
  [Return]                ${returnedResponse}

Post Test Suite Results to TestRail
  [Arguments]                     ${testRunID}
  IF                              '${testRunID}' != 'SkipMe'
    ${resultsListLength}=         Get Length    '${TESTRUN_RESULTS_LIST}'
    IF                            ${resultsListLength} > ${emptyListSize}
      &{resultsDictionary}=       Create Dictionary   results=${TESTRUN_RESULTS_LIST}
      ${returnedResponse}=        API.Send POST Request
      ...                         ${sessionDict}
      ...                         ${resultsDictionary}
      ...                         ${multiCasePost}${testRunID}
      Log                         ${returnedResponse}
    ELSE
      ${returnedResponse}=        Set Variable    Results Not Available for Posting
    END
  ELSE
    ${returnedResponse}=          Set Variable    Missing TestRunID to post to
  END
  [Return]                        ${returnedResponse}

Gather Test Results
  [Documentation]
  ...   Called by the Common.End Browser Test, this retrieves the current test's
  ...   results and logs them to a List of Results Dictionaries.  Data is converted
  ...   from Robot's Pass/Fail statuses to TestRail's Pass/Fail statuses, a 1 for
  ...   PASS and a 5 for a FAIL.
  ...   The logic is:
  ...   1. Retrieve the Tags
  ...   2. If no TestCaseID tag exists, skip all remaining logic
  ...   3. Convert the Robot Pass/Fail to TestRail's Pass/Fail statuses
  ...   4. Create a dictionary containing the Test Case ID, Test Status, and Error
  ...       message
  ...   5. Create a GLOBAL list from the Dictionary if one doesn't exist or append
  ...       the dictionary to the existing list
  Log                           Tags are: ${TEST TAGS}
  ${testCaseID}=                Parse Test Tags
  ${testCaseIdLength}=          Get Length    ${testCaseID}
  IF                            ${testCaseIdLength} > 0
    IF                          '${TEST STATUS}' == 'PASS'
        ${testStatusID}=        Set Variable    ${testCasePassStatus}
    ELSE
        ${testStatusID}=        Set Variable    ${testCaseFailStatus}
    END
    ${testResultDict}=          Create Dictionary   case_id=${testCaseID}
    ...   status_id=${testStatusID}
    ...   comment=${TEST MESSAGE}
    ${resultsListLength}        Get Length    '${TESTRUN_RESULTS_LIST}'
    IF                          ${resultsListLength} > ${emptyListSize}
        Append To List          ${TESTRUN_RESULTS_LIST}   ${testResultDict}
        Set Global Variable     @{TESTRUN_RESULTS_LIST}
    ELSE
        @{TESTRUN_RESULTS_LIST}=  Create List    ${testResultDict}
        Set Global Variable     @{TESTRUN_RESULTS_LIST}
    END
  END

Parse Test Tags
  [Documentation]
  ...   Called by `Gather Test Result`, this retrieves all tags and loops through them
  ...   to obtain the `testcaseid`.  Since it's specifically looking for the following
  ...   format:
  ...   `testcaseid=#####`
  ...   it will retrieve the Test Case ID SubString by offsetting it by 11 characters
  ...   The logic is:
  ...   1. Determine if there are tags.  If not, skip everything.
  ...   2. Loop through all tags to determine if any tag contains `testcaseid=`
  ...   3. Retrieve the Test Case ID and pull it into a variable
  ...   4. Return the Test Case ID to the calling parent keyword
  ${tagLength}=           Get Length    ${TEST TAGS}
  # Skip this if there are no tags
  IF                      ${tagLength} > 0
    FOR                   ${item}   IN    @{TEST TAGS}
      # Convert to lower case
      ${item}=            Convert To Lower Case   ${item}
      Log                 Tag is: ${item}
      # Skip this if there are no 'testcaseid' tags
      ${itemEvaluator}=   Evaluate    '${item}'.find('testcaseid=')
      IF                  ${itemEvaluator} > -1
          ${testCaseID}=  Get Substring   ${item}   ${testCaseTagSize}
      END
      Log                 This is the TestCaseID: ${testCaseID}
    END
  END
  # Return the tag
  [Return]                ${testCaseID}
