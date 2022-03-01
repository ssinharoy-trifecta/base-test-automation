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

*** Keywords ***
Complete New Customer Form
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Click Element             ${firstNameField}
  Input Text                ${firstNameField}        ${firstName}
  Click Element             ${lastNameField}
  Input Text                ${lastNameField}         ${lastName}
  Click Element             ${emailField}
  Input Text                ${emailField}            ${TEST_EMAIL}
  Click Element             ${passwordField}
  Input Text                ${passwordField}         ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}  ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn} 
  Wait Until Page Contains  My Account