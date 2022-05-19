*** Settings ***
Library            SeleniumLibrary
Library            json
Library            OperatingSystem
Library            BuiltIn
Library            String
Library            Collections
Resource           ../../Common/Resources/Common.robot
Resource           ../../Common/Resources/CustomerController.robot
Resource           ../../Common/Resources/Authentication/CustomerLogin.robot
Resource           ../Resources/DataFile.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   ${testRunID}
Test Setup          Common.Begin Browser Test  
...                 ${MAGENTO_SHOP_HOME}  
...                 ${runlocal}
...                 ${configBS}
Test Teardown       Common.End Browser Test

*** Variables ***
@{CUSTLISTJSON}

*** Test Cases ***
Login Using Templating - Robot
  [Template]  Template Login Test
  ${loginUrlRob}  ${dangaCustData}
  ${loginUrlRob}  ${mickeyCustData}
  ${loginUrlRob}  ${dragonCustData}

Login As Users From Robot Datafile
  Modified Login Test                           ${loginUrlRob}  ${CUSTLISTROB}

Login As Users From JSON Datafile
  [Tags]    json
  ${CUSTLISTJSON}=            Get JSON in Robot   Examples/Web/Resources/DataFile.json
  Go To                       ${loginUrlRob} 
  Wait Until Page Contains    Customer Login
  FOR                         ${item}  IN  @{CUSTLISTJSON} 
    Log                       ${item}
    Input Text                ${loginEmailField}  ${item}[2]
    Input Text                ${loginPassField}   ${item}[3]
    Click Button              Sign In
    Sleep                     2s
    Go To                     ${loginUrlRob} 
  END

Login As Users From CSV Datafile
  FOR                                           ${item}  IN  @{CUSTLISTCSV}               
    Go To                                       ${loginUrlCSV}
    CustomerLogin.Login As Registered Customer  ${CUSTLISTCSV}
  END

*** Keywords ***    
Get JSON in Robot 
    [Arguments]            ${file_path}
    ${data_as_string} =    Get File                    ${file_path}
    Log                    ${data_as_string}
    &{data_as_json} =      json.loads                  ${data_as_string}
    Log                    ${data_as_json}
    ${data_as_json}=       Convert To String           ${data_as_json}
    Log                    ${data_as_json}
    ${data_as_json}=       Remove String               ${data_as_json}  }  '  [  ]  ${SPACE}
    ${data_as_json}=       Replace String              ${data_as_json}  :  =
    Log                    ${data_as_json}
    @{list_string}=        split string                ${data_as_json}  {
    Log                    ${list_string}[2]
    Log                    ${list_string}[3]
    Log                    ${list_string}[4]
    @{jsonCust1}=          Splitting Lists Into Lists  ${list_string}[2]
    Log                    ${jsonCust1}
    @{jsonCust2}=          Splitting Lists Into Lists  ${list_string}[3]
    @{jsonCust3}=          Splitting Lists Into Lists  ${list_string}[4]
    @{CUSTLISTJSON}=       Create List  ${jsonCust1}  ${jsonCust2}  ${jsonCust1}
    [Return]               ${CUSTLISTJSON}

Splitting Lists Into Lists 
  [Arguments]            ${listStringToParse}   
  @{split_keyvalue}=     split string   ${listStringToParse}  , 
  Log                    ${split_keyvalue}
  @{keyValuePairList1}=  split string   ${split_keyvalue}[0]  =
    Log                  ${keyValuePairList1}
  @{keyValuePairList2}=  split string   ${split_keyvalue}[1]  =
    Log                  ${keyValuePairList2}
    Log                  ${keyValuePairList2}[1]
  @{keyValuePairList3}=  split string   ${split_keyvalue}[2]  =
    Log                  ${keyValuePairList3}
  @{keyValuePairList4}=  split string   ${split_keyvalue}[3]  =
    Log                  ${keyValuePairList4}
  @{keyValuePairList5}=  split string   ${split_keyvalue}[4]  =
    Log                  ${keyValuePairList5} 
  ${setFirstName}=       Set Variable  ${keyValuePairList2}[1]
  ${setLastName}=        Set Variable  ${keyValuePairList3}[1]
  ${setEmail}=           Set Variable  ${keyValuePairList4}[1]
  ${setPassword}=        Set Variable  ${keyValuePairList5}[1]
  @{jsonReturnList}=     Create List
  ...                    ${setFirstName}        
  ...                    ${setLastName}       
  ...                    ${setEmail}       
  ...                    ${setPassword}   
  Log                    ${jsonReturnList}
  Log                    ${split_keyvalue}[0]
  Log                    ${split_keyvalue}[1]
  Log                    ${split_keyvalue}[2]
  Log                    ${split_keyvalue}[3]
  [Return]               ${jsonReturnList}

Modified Login Test
  [Arguments]                 ${loginURL}         ${custDict}
  Go To                       ${loginURL} 
  Wait Until Page Contains    Customer Login
  FOR                         ${item}  IN  @{custDict} 
    Log                       ${item}
    Input Text                ${loginEmailField}  ${item.email}
    Input Text                ${loginPassField}   ${item.password}
    Sleep                     2s
    Click Button              Sign In
    Sleep                     2s
    Go To                     ${loginUrlRob} 
  END

Template Login Test
  [Arguments]                 ${loginURL}         ${custDict}
  Go To                       ${loginURL} 
  Wait Until Page Contains    Customer Login
  Input Text                  ${loginEmailField}  ${custDict.email}
  Input Text                  ${loginPassField}   ${custDict.password}
  Sleep                     2s
  Click Button              Sign In
