*** Settings ***
Library  Collections
Library  json

*** Variables ***
${MY_DATA_TABLE_VALUES_TEMP}  {"foo": "this is foo", "bar": "this is bar"}

*** Keywords ***
Converting a JSON File
    ${MY_DATA_TABLE_VALUES}    evaluate  json.loads($MY_DATA_TABLE_VALUES_TEMP)    json
    [Return]  ${MY_DATA_TABLE_VALUES}

*** Test Cases ***
Example
    ${data}=  Converting a JSON File
    Log        ${data}
    Log        ${data.foo}
    ${datatype}=  evaluate  str(type($data))
    Log           ${datatype}
    should be equal  ${datatype}  <class 'dict'>
    should be equal  ${data['foo']}  this is foo
