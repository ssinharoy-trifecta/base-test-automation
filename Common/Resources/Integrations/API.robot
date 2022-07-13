*** Settings ***
Library      RequestsLibrary

Documentation
...    This needs to take a couple of dictionary of items such as:
...   * headers
...   * Cookies
...   The following items need to be passed in as parameters
...   * Authentication info
...   * URL


*** Variables ***
${apiBaseEndpoint}
${apiGetUrl}
${apiUser}
${apiKey}
@{apiAuthData}          ${apiUser}    ${apiKey}
${passFailID}
${resultComment}
${apiPostUrl}

*** Keywords ***
GET Request And Verify 200 Status
    [Arguments]
    ...                 ${apiSessionDict}
    ...                 ${apiGetUrl}
    Create Session      Test_Session
    ...                 &{apiSessionDict}
    ...                 verify=True
    ${response}=        GET On Session              Test_Session           ${apiGetUrl}
    # Get response code
    ${statusCode}       Convert To String           ${response.status_code}
    Should Be Equal     ${statusCode}               200
    Delete All Sessions
    [Return]            ${response}

Simple GET Request
    [Arguments]
    ...                 ${apiSessionDict}
    ...                 ${apiGetUrl}
    Create Session      Test_Session
    ...                 &{apiSessionDict}
    ...                 verify=True
    ${response}=        GET On Session              Test_Session           ${apiGetUrl}
    Delete All Sessions
    [Return]            ${response}

Send POST Request
    [Arguments]
    ...                 ${apiSessionDict}
    ...                 ${dictJSON}
    ...                 ${apiPostUrl}
    Create Session      Test_Session
    ...                 &{apiSessionDict}
    ...                 verify=True
    ${postJSON}=        evaluate                json.dumps(${dictJSON})     json
    Log                 ${postJSON}
    # Post results to TestRail using JSON
    ${response}=        POST On Session
    ...                 Test_Session
    ...                 url=${apiPostUrl}
    ...                 json=${dictJSON}
    Log                 ${response}
    Delete All Sessions
    [Return]            ${response}
