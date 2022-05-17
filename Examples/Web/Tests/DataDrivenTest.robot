*** Settings ***
Library            SeleniumLibrary
Library            json
Library            OperatingSystem
Library            BuiltIn
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

*** Test Cases ***
Login Using Templating - Robot
  [Template]  CustomerController.Login
  ${dangaCustData}
  ${mickeyCustData}
  ${dragonCustData}

Login As Users From Robot Datafile
  FOR                                           ${item}  IN  @{CUSTLISTROB}               
    Go To                                       ${loginUrlRob}
    Log                                         ${item}
    CustomerLogin.Login As Registered Customer  ${item}
  END

Login As Users From JSON Datafile
  [Tags]    json
  Get JSON in Robot                             Examples/Web/Resources/DataFile.json
  FOR                                           ${item}  IN  @{CUSTLISTJSON}               
    Go To                                       ${loginUrlJSON}
    CustomerLogin.Login As Registered Customer  ${CUSTLISTJSON}
  END

Login As Users From CSV Datafile
  FOR                                           ${item}  IN  @{CUSTLISTCSV}               
    Go To                                       ${loginUrlCSV}
    CustomerLogin.Login As Registered Customer  ${CUSTLISTCSV}
  END

*** Keywords ***    
Get JSON in Robot 
    [Arguments]            ${file_path}
    ${data_as_string} =    Get File           ${file_path}
    Log                    ${data_as_string}
    ${data_as_json} =      json.loads         ${data_as_string}
    Log                    ${data_as_json}
    ${json}=               Convert To String  ${data_as_json}
    Log                    ${json}
    [Return]               ${data_as_json}
