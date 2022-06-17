*** Settings ***
Documentation
...     This is a documentation block and every file needs this at the top

# Library 	SeleniumLibrary
Library   json
Library   OperatingSystem
Library   BuiltIn
Library   RequestsLibrary

*** Variables ***
${apiBaseEndpoint}  https://parse-preprod.trifectanutrition.com/
${apiGetUrl}        ${apiBaseEndpoint}parse/classes/Challenges
&{headers}          X-Parse-Application-Id=hCzrz7Q9hh0Eoe8SESLRDqBFwC62yZRZDCRekYTy   
...                 X-Parse-Master-Key=NrtEgkEMysysUFK78eqHQQF6SQpRssuBsFADvRYn263cxqBG6XHcF6FY6PH4
...                 Content-Type=application/json
@{apiSessionList}   ${apiBaseEndpoint}
...                 &{headers}

*** Test Cases ***
Test Parse Returns Data  
  Create Session        TestSession              @{apiSessionList}
  ${response}=          Get On Session           TestSession   ${apiGetUrl}
  Log                   ${response.content}
  Log                   ${response.status_code}
  Should Not Be Empty   ${response.content}   
  ${statusCode}         Convert To String        ${response.status_code}
  Should Be Equal       ${statusCode}  200
