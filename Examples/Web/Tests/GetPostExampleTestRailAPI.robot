*** Settings ***
Library     RequestsLibrary
Library     ../../../Common/Resources/GetEnvVars.py
Variables   ../../../Common/Resources/GetEnvVars.py
Resource    ../../../Common/Resources/Integrations/API.robot
Documentation
...    You'll need to update the testrail_env.py file with the TestRail User, password, and API Key
...    This is found in LastPass

*** Variables ***
${envPath}          ${PATH_TO_ENV}
${getURL}           index.php?/api/v2/get_case/8696
${singleCasePost}   index.php?/api/v2/add_result_for_case/365/8696
${multiCasePost}    index.php?/api/v2/add_results_for_cases/365
${passFailStatus}
${passFailComment}

*** Test Cases ***
Simple Get Request
  ${sessionDict}=       Set TestRail Variables  ${envPath}
  ${response}=          API.Simple GET Request
  ...                   ${sessionDict}
  ...                   ${getURL}
  Log                   ${response.content}
  Log                   ${response.status_code}
  Should Not Be Empty   ${response.content}
  ${statusCode}         Convert To String        ${response.status_code}
  Should Be Equal       ${statusCode}  200

Sample Get Request And Fetch Status
  [Documentation]
  ...    Returns the contents of the Purchase A Meal Plan test case
  ${sessionDict}=         Set TestRail Variables  ${envPath}
  ${returnedResponse}=    API.GET Request And Verify 200 Status
  ...                     ${sessionDict}
  ...                     ${getURL}
  Log                     ${returnedResponse}

Sample Post Request
  [Documentation]
  ...                     Posts a result to the Purchase A Meal Plan
  ${sessionDict}=         Set TestRail Variables  ${envPath}
  ${passFailStatus}=      Set Variable          1
  ${passFailComment}=     Set Variable          This is a test from rob ot
  ${dictJSON}=            Create Dictionary     status_id=${passFailStatus}     comment=${passFailComment}
  ${returnedResponse}=    API.Send POST Request
  ...                     ${sessionDict}
  ...                     ${dictJSON}
  ...                     ${singleCasePost}
  Log                     ${returnedResponse}

Sample Post Request For Cases
  [Documentation]
  ...    Post the results for 2 cases, Purchase a Meal Plan and Purchase a Meal Plan with a 1 Time Coupon
  # TODO: Parameterize Run ID, TestCase ID, and Case Results
  # TODO: Each Test needs to save off it's results?
  # TODO: For each result, add it to the list using looping
  # Dictionary for result set 1
  ${handWritten1}=        Create Dictionary   case_id=8696      status_id=5   comment=This fails because I said so
  # Dictionary for result set 2
  ${handWritten2}=        Create Dictionary   case_id=8697      status_id=1   comment=This passes because I said so
  # Add all results to a list
  ${handWritten3}=        Create List         ${handWritten1}   ${handWritten2}
  # Results list is added to a final dictionary for submission
  ${handWrittenFinal}=    Create Dictionary   results=${handWritten3}
  Log                     '${handWrittenFinal}'
  ${sessionDict}=         Set TestRail Variables  ${envPath}
  # Post created
  ${returnedResponse}=    API.Send POST Request
  ...                     ${sessionDict}
  ...                     ${handWrittenFinal}
  ...                     ${multiCasePost}
  Log                     ${returnedResponse}

*** Keywords ***
Set TestRail Variables
  [Arguments]           ${envPath}
  &{envVars}=           GetEnvVars.Retrieve_DotEnv    ${envPath}
  @{authData}=          Set Variable
  ...                   ${envVars.TESTRAIL_USER}
  ...                   ${envVars.TESTRAIL_APIKEY}
  &{testRailSession}=   Create Dictionary 
  ...                   url=${envVars.TESTRAIL_URL}
  ...                   auth=@{authData}
  [Return]              &{testRailSession}
