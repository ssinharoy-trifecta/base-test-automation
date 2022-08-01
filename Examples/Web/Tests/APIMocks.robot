*** Settings ***
Documentation
...     This is a series of mock API requests and relies on the BeeCeptor.com
...     account/website being available to send requests to.  The point of this
...     is to show how to make requests using the API.Robot file.  Credentials
...     for BeeCeptor are found in LastPass.  Endpoints are as follows:
...     - https://trifectanutrition.free.beeceptor.com/delete
...     - https://trifectanutrition.free.beeceptor.com/get
...     - https://trifectanutrition.free.beeceptor.com/patch
...     - https://trifectanutrition.free.beeceptor.com/post
...     - https://trifectanutrition.free.beeceptor.com/put

Resource  ../../../Common/Resources/Integrations/API.robot
Library   SeleniumLibrary

*** Variables ***
${beeCeptorURL}   https://trifectanutrition.free.beeceptor.com/
${deleteURL}      ${beeCeptorURL}delete
${getURL}         ${beeCeptorURL}get
${patchURL}       ${beeCeptorURL}patch
${postURL}        ${beeCeptorURL}post
${putURL}         ${beeCeptorURL}put
&{authDict}       user='testuser'   pass='testpass'
&{headersDict}    Content-Type=application/json   Accept-Encoding='gzip, deflate'
&{jsonDict}       test=test   this=that

*** Test Cases ***
Test Delete Request
  &{sessionDict}=   Generate Session Dictionary
  ${response}=      API.Send Delete Request
  ...               ${sessionDict}
  ...               ${jsonDict}
  ...               ${deleteURL}
  ...               200
Test Get Request
  &{sessionDict}=   Generate Session Dictionary
  ${response}=      API.Simple GET Request
  ...               ${sessionDict}
  ...               ${getURL}
Test Patch Request
  &{sessionDict}=   Generate Session Dictionary
  ${response}=      API.Send Patch Request
  ...               ${sessionDict}
  ...               ${jsonDict}
  ...               ${patchURL}
  ...               200
Test Post Request
  &{sessionDict}=   Generate Session Dictionary
  ${response}=      API.Send Post Request
  ...               ${sessionDict}
  ...               ${jsonDict}
  ...               ${postURL}
Test Put Request
  &{sessionDict}=   Generate Session Dictionary
  ${response}=      API.Send Put Request
  ...               ${sessionDict}
  ...               ${jsonDict}
  ...               ${putURL}
  ...               200

*** Keywords ***
Generate Session Dictionary
  [Documentation]
  ...   Created this because usually, the session dictionary can be created
  ...   dynamically rather that in the ***Variables*** section.  This is the
  ...   more likely way you'd create your session dictionary
  &{sessionDict}    Create Dictionary
  ...               url=${beeCeptorURL}
  ...               headers=${headersDict}
  ...               auth=${authDict}
  [Return]          &{sessionDict}

*** Comments ***
... this is a comment
