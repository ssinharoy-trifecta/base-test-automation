*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${firstNameField}           id = firstname
${firstName}                Elden
${lastNameField}            id = lastname
${lastName}                 Ring
${emailField}               id = email_address
${passwordField}            id = password
${password}                 F4rF4rAway
${passwordConfirmField}     id = password-confirmation    
${createAccountBtn}         xpath = //*[@id="form-validate"]/div/div[1]/button
${createValidationText}     Create New Customer Account
${uniqueData}               TestTestTest

*** Keywords ***
Complete New Customer Form
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Click Element             ${firstNameField}
  Input Text                ${firstNameField}             ${firstName}
  Click Element             ${lastNameField}
  Input Text                ${lastNameField}              ${lastName}
  Click Element             ${emailField}
  Input Text                ${emailField}                 ${TEST_EMAIL}
  Click Element             ${passwordField}
  Input Text                ${passwordField}              ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}       ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn} 
  Wait Until Page Contains  My Account
  
Generate New eMail Address
  [Documentation]
  ...   This is a Test Case scoped global variable and can be reference anywhere in a given test
  ...   case.  Should this value need to be scoped larger than that, this can be re-scoped to use
  ...   a Test Suite or Global scope using `Set Suite Variable` or `Set Global Variable` 
  ...   respectively.  This should be executed at the Test Case level and should be used sparingly
  [Arguments]               ${uniqueData}
  ${generatedEmail}         Set Variable                  selenium+${uniqueData}\@trifectanutrition.com
  Set Test Variable         ${UNIQUE_EMAIL_TEST_SCOPED}   ${generatedEmail}
  Log                       ${UNIQUE_EMAIL_TEST_SCOPED}