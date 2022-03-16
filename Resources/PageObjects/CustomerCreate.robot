*** Settings ***
Library                     SeleniumLibrary
Library                     DateTime

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

*** Keywords ***
Complete New Customer Form
  #TODO: Refactor hardcoded values to allow values to be passed in
  ${emailAddress}           Generate New eMail Address
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Click Element             ${firstNameField}
  Input Text                ${firstNameField}             ${firstName}
  Click Element             ${lastNameField}
  Input Text                ${lastNameField}              ${lastName}
  Click Element             ${emailField}
  Input Text                ${emailField}                 ${emailAddress}
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
  [return]                  ${generatedEmail}