*** Settings ***
Library                     SeleniumLibrary
Library                     DateTime

*** Variables ***
${fNameField}               id = firstname
${fNames}                   Elden
${lNameField}               id = lastname
${lNames}                   Ring
${emailField}               id = email_address
${passwordField}            id = password
${password}                 F4rF4rAway
${passwordConfirmField}     id = password-confirmation    
${createAccountBtn}         xpath = //*[@id="form-validate"]/div/div[1]/button

*** Keywords ***
Complete New Customer Form
  Wait Until Page Contains  Create New Customer Account
  #Create new user with unique email string
  ${currentDate}=           Get Current Date         result_format=%m-%d-%y.%H.%M.%S.%s
  ${TEST_EMAIL}             Set Variable             selenium+${currentDate}\@trifectanutrition.com
  #Use same test email for other tests
  Set Global Variable       ${TEST_EMAIL}
  Log                       ${TEST_EMAIL}
  #Input form
  Click Element             ${fNameField}
  Input Text                ${fNameField}            ${fNames}
  Click Element             ${lNameField}
  Input Text                ${lNameField}            ${lNames}
  Click Element             ${emailField}
  Input Text                ${emailField}            ${TEST_EMAIL}
  Click Element             ${passwordField}
  Input Text                ${passwordField}         ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}  ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn} 
  Wait Until Page Contains  My Account