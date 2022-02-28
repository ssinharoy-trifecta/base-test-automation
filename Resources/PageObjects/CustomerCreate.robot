*** Settings ***
Library                     SeleniumLibrary
Library                     DateTime
Library                     BuiltIn

*** Variables ***
${fNameField}               id = firstname
${fNames}                   Elden
${lNameField}               id = lastname
${lNames}                   Ring
${emailField}               id = email_address
${email}                    eldenring1@trifecta.com
${passwordField}            id = password
${password}                 Password1
${passwordConfirmField}     id = password-confirmation    
${createAccountBtn}         xpath = //*[@id="form-validate"]/div/div[1]/button

*** Keywords ***
Complete New Customer Form
  Wait Until Page Contains  Create New Customer Account
  Click Element             ${fNameField}
  Input Text                ${fNameField}            ${fNames}
  Click Element             ${lNameField}
  Input Text                ${lNameField}            ${lNames}
#TODO random email strings
  Click Element             ${emailField}
  Input Text                ${emailField}            ${email}
  Click Element             ${passwordField}
  Input Text                ${passwordField}         ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}  ${password}
  Sleep                     3s
  Click Button              ${createAccountBtn} 
  Wait Until Page Contains  My Account