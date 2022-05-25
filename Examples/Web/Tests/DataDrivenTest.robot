*** Settings ***
Documentation
...  This file provides examples on how to use datafiles to pass data into your tests(.robot,.json,.csv).
...  This file demonstrates how to include custom created python libraries and include them (Csv.py)
...  This file demonstrates how to parse strings and lists and extract relevant data.
...  example cli command: robot -v runLocal:yes -i json -d results Examples/Web/Tests/DataDrivenTest.robot

*** Settings ***
Library            SeleniumLibrary
# json library handles json data files
Library            json
Library            OperatingSystem
Library            BuiltIn
Library            String
Library            Collections
Library            ../Libraries/Csv.py
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
#@{CUSTLISTJSON}

*** Test Cases ***
#Template will run the same keyword multiple times, with the paremeters passed through.
#Could potentially be used in lieu of batch files.
Login Using Templating - Robot
  [Template]  Template Login Test
  ${loginUrlRob}  ${dangaCustData}
  ${loginUrlRob}  ${mickeyCustData}
  ${loginUrlRob}  ${dragonCustData}

#Easiest form of using data from a file within Robot framework. Variables can be treated
#the same as if they were in this file.
Login As Users From Robot Datafile
  Modified Login Test  ${loginUrlRob}  ${CUSTLISTROB}

#Use data from a JSON datafile. This test case uses string manipulation and lists to accomplish
#the parsing of the json file, but there are better ways to do this.
Login As Users From JSON Datafile
  [Tags]                      json
  @{CUSTLISTJSON}=            Get JSON in Robot   Examples/Web/Resources/DataFile.json
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

#CSV is fairly easy to get data from. We created a Csv.py library to achieve the data importing
#from the CSV.
Login As Users From CSV Datafile
  [Tags]                      csv
  ${loginScenarios}           Get CSV Data         Examples/Web/Resources/DataFile.csv
  Log                         ${loginScenarios}
  FOR                         ${item}  IN  @{loginScenarios}
    Go To                     ${loginUrlRob}
    Wait Until Page Contains  Customer Login
    Log                       ${item}
    Input Text                ${loginEmailField}  ${item}[0]
    Input Text                ${loginPassField}   ${item}[1]
    Click Button              Sign In
    Sleep                     2s 
  END

#Better way to extract data from json datafile.
Show Parse of JSON Using Python
  [Tags]                       json
  ${CUSTLISTJSON}=             Get JSON in Robot   Examples/Web/Resources/DataFile.json
  Go To                        ${loginUrlRob} 
  Wait Until Page Contains     Customer Login
  Parse JSON File With Python  Examples/Web/Resources/DataFile.json

*** Keywords ***    
Get JSON in Robot 
    [Arguments]            ${file_path}
    ${data_as_string} =    Get File                    ${file_path}
    Log                    ${data_as_string}
    &{data_as_json} =      json.loads                  ${data_as_string}
    Log                    ${data_as_json}
    ${data_as_json}=       Convert To String           ${data_as_json}
    Log                    ${data_as_json}
    #This keyword privides an example on how to parse complex strings and lists
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

#This keyword further shows how to split lists into smallers lists. This is an ugly way to
#do it and can be better worked into loops.
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
  [Arguments]                 ${loginURL}         ${cust}
  Go To                       ${loginURL} 
  Wait Until Page Contains    Customer Login
  FOR                         ${item}  IN  @{cust} 
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
  Sleep                       2s
  Click Button                Sign In

#This keyword uses Csv.py library. This is a good example on how to create our own python libraries
Get CSV Data
  [Arguments]  ${FilePath}
  ${Data}=     read csv file  ${FilePath}
  [Return]     ${Data}

#This is a better way to read and parse json files. Using Python, we do not need to convert
#or split into lists, we can already use it as a dictionary since that is the way we accept
#it from the json datafile. Output can be seen in results file.
Parse JSON File With Python
    [Arguments]            ${file_path}
    ${data_as_string} =    Get File                    ${file_path}
    Log                    ${data_as_string}
    ${data_as_json}        evaluate                    json.loads('''${data_as_string}''')   json
    Log                    ${data_as_json}
    &{data_as_json_dict}   convert to dictionary       ${data_as_json}
    log many               &{data_as_json_dict}
    @{dictPop} =           Pop From Dictionary         ${data_as_json_dict}                  Customers
    FOR                    ${customer}                 IN                                    @{dictPop}
      log many             ${customer}
      FOR                  ${entry}                    IN                                    ${customer}
        ${custNumber}=     Pop From Dictionary         ${entry}                              testCust
        ${custFName}=      Pop From Dictionary         ${entry}                              firstName
        ${custLName}=      Pop From Dictionary         ${entry}                              lastName
        ${custEMail}=      Pop From Dictionary         ${entry}                              email
        ${custPWord}=      Pop From Dictionary         ${entry}                              password
        log                ${custNumber}
        log                ${custFName}
        log                ${custLName}
        log                ${custEMail}
        log                ${custPWord}
      END
    END
