*** Settings ***
Library                     SeleniumLibrary
Library                     DateTime

*** Variables ***
${firstNameField}           id = firstname
${lastNameField}            id = lastname
${emailField}               id = email_address
${passwordField}            id = password
${passwordConfirmField}     id = password-confirmation    
${createAccountBtn}         xpath = //*[@id="form-validate"]/div/div[1]/button
${createValidationText}     Create New Customer Account

*** Keywords ***
Complete New Customer Form
  [Arguments]               ${firstName}                  ${lastName}   ${testCaseEmail}   ${password}
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Click Element             ${firstNameField}
  Input Text                ${firstNameField}             ${firstName}
  Click Element             ${lastNameField}
  Input Text                ${lastNameField}              ${lastName}
  Click Element             ${emailField}
  Input Text                ${emailField}                 ${testCaseEmail}
  Click Element             ${passwordField}
  Input Text                ${passwordField}              ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}       ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn} 
  Wait Until Page Contains  My Account
  
Generate New eMail Address
  [Documentation]
  ...   This creates a unique eMail based on DateTime
  ${currentDate}=           Get Current Date              result_format=%m-%d-%y.%H.%M.%S.%s
  ${generatedEmail}         Set Variable                  selenium+${currentDate}\@trifectanutrition.com
  [Return]                  ${generatedEmail}