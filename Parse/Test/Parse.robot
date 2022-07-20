*** Settings ***
Documentation
...     This is a documentation block and every file needs this at the top

Library     json
Library     OperatingSystem
Library     BuiltIn
Library     Collections
Resource    ../../Common/Resources/Integrations/API.robot
Library     ../../Common/Resources/GetEnvVars.py

*** Variables ***
${apiBaseEndpoint}  https://parse-preprod.trifectanutrition.com/
${apiGetUrl}        ${apiBaseEndpoint}parse/classes/Challenges
&{headers}          
&{apiSessionList}   
${pathToDotEnv}     .env

*** Test Cases ***
Test Parse Returns Data
  &{apiSessionList}     Set Parse Variables
  ${response}=          API.Simple GET Request
  ...   ${apiSessionList}
  ...   ${apiGetUrl}
  Log                   ${response.content}
  Log                   ${response.status_code}
  Should Not Be Empty   ${response.content}
  ${statusCode}         Convert To String   ${response.status_code}
  Should Be Equal       ${statusCode}  200

*** Keywords ***
Set Parse Variables
  #retreive variables, then return the dictionary here.  From there, set variables inside the test
  &{envVars}=           GetEnvVars.Retrieve_DotEnv    ${pathToDotEnv}
  ${parseAppID}=        Get From Dictionary   ${envVars}    PARSE_APP_ID
  ${parseMasterKey}=    Get From Dictionary   ${envVars}    PARSE_MASTER_KEY
  ${headers}            Create Dictionary
  ...                   X-Parse-Application-Id=${parseAppID}
  ...                   X-Parse-Master-Key=${parseMasterKey}
  ...                   Content-Type=application/json
  ${parseSession}       Create Dictionary
  ...                   url=${apiBaseEndpoint}
  ...                   headers=${headers}
  [Return]              &{parseSession}
