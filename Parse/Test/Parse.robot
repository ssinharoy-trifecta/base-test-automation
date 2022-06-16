*** Settings ***
Documentation
...     This is a documentation block and every file needs this at the top

# Library 	SeleniumLibrary
Library   json
Library   OperatingSystem
Library   BuiltIn
Library   RequestsLibrary

*** Variables ***
${apiBaseEndpoint}  http://localhost:1337/
${apiGetUrl}        ${apiBaseEndpoint}parse/classes/Challenges
&{headers}          X-Parse-Application-Id=hCzrz7Q9hh0Eoe8SESLRDqBFwC62yZRZDCRekYTy   
...                 X-Parse-Master-Key=NrtEgkEMysysUFK78eqHQQF6SQpRssuBsFADvRYn263cxqBG6XHcF6FY6PH4
...                 Content-Type=application/json
@{apiSessionList}   ${apiBaseEndpoint}
...                 &{headers}

*** Test Cases ***
Test Parse Returns Data  
  Create Session        TestSession       @{apiSessionList}
  ${response}=          Get On Session    TestSession   ${apiGetUrl}
  Log                   ${response.content}
  ${response.content}   Should Not Be Empty
