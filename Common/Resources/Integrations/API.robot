*** Settings ***
Library      RequestsLibrary

Documentation
...   The following items need to be passed in as parameters
...   * Session Dictionary variable
...   * URL
...   The session dictionary variable contains items such as:
...   * headers
...   * authentincation info
...   * cookies
...   * any other kwargs


*** Variables ***
${apiBaseEndpoint}
${apiGetUrl}
${apiUser}
${apiKey}
@{apiAuthData}  ${apiUser}  ${apiKey}
${passFailID}
${resultComment}
${apiPostUrl}
${expectedStatus}   any
# TODO: Update all calls to recycle as needed:
# - Create Session
# - All Get, Delete, Patch, Put, and Post do the same things
# - Allow ability to validate specific codes?
# - Needs data/json to be optionally supplied

*** Keywords ***
GET Request And Verify 200 Status
    [Arguments]
    ...               ${apiSessionDict}
    ...               ${apiGetUrl}
    Create Session    Test_Session
    ...               &{apiSessionDict}
    ...               verify=True
    ${response}=      GET On Session      Test_Session  ${apiGetUrl}
    # Get response code
    ${statusCode}     Convert To String   ${response.status_code}
    Should Be Equal   ${statusCode}       200
    Delete All Sessions
    [Return]          ${response}

Send Delete Request
    [Arguments]
    ...             ${apiSessionDict}
    ...             ${apiDeleteUrl}
    ...             ${expectedStatus}
    Create Session  Test_Session
    ...             &{apiSessionDict}
    ...             verify=True
    ${response}=    DELETE On Session   Test_Session
    ...             ${apiDeleteUrl}
    ...             ${expectedStatus}
    Delete All Sessions

Simple GET Request
    [Arguments]
    ...             ${apiSessionDict}
    ...             ${apiGetUrl}
    Create Session  Test_Session
    ...             &{apiSessionDict}
    ...             verify=True
    ${response}=    GET On Session  Test_Session  ${apiGetUrl}
    Delete All Sessions
    [Return]        ${response}


Send Patch Request
    # TODO: Refactor this so that it can OPTIONALLY take the Data/JSON as a param
    [Arguments]
    ...             ${apiSessionDict}
    ...             ${dictData}
    ...             ${dictJSON}
    ...             ${apiPatchUrl}
    ...             ${expectedStatus}
    Create Session  Test_Session
    ...             &{apiSessionDict}
    ...             verify=True
    # Handle ${dictData} or ${dictJSON} cases.  Both empty, full, or only 1
    # If both empty, else if both full else if one empty, else, end
    ${response}=    DELETE On Session   Test_Session
    ...             ${apiPatchUrl}
    ...             ${expectedStatus}
    ...             ${patchData}
    Delete All Sessions
    
Send POST Request
    # TODO: Refactor this so that it can OPTIONALLY take the JSON as a param
    [Arguments]
    ...             ${apiSessionDict}
    ...             ${dictJSON}
    ...             ${apiPostUrl}
    Create Session  Test_Session
    ...             &{apiSessionDict}
    ...             verify=True
    ${postJSON}=    evaluate  json.dumps(${dictJSON})   json
    Log             ${postJSON}
    # Post results to TestRail using JSON
    ${response}=    POST On Session
    ...             Test_Session
    ...             url=${apiPostUrl}
    ...             json=${dictJSON}
    Log             ${response}
    Delete All Sessions
    [Return]        ${response}

Send Put Request
    # TODO: Refactor this so that it can OPTIONALLY take the Data/JSON as a param
    [Arguments]
    ...             ${apiSessionDict}
    ...             ${dictData}
    ...             ${dictJSON}
    ...             ${apiPutUrl}
    ...             ${expectedStatus}
    Create Session  Test_Session
    ...             &{apiSessionDict}
    ...             verify=True
    # Handle ${dictData} or ${dictJSON} cases.  Both empty, full, or only 1
    # If both empty, else if both full else if one empty, else, end
    ${response}=    DELETE On Session   Test_Session
    ...             ${apiPutUrl}
    ...             ${expectedStatus}
    ...             ${putData}
    Delete All Sessions

