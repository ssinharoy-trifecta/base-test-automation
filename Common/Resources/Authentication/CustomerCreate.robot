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
${createAccountOLBtn}       xpath=/html/body/div[3]/aside/div[2]/div/div/div[1]/div[2]/div/div/a
${createValidationText}     Create New Customer Account

*** Keywords ***
Complete New Customer Form
  [Arguments]
  ...                       ${firstName}              ${lastName}
  ...                       ${testCaseEmail}          ${password}
  IF                        '${testCaseEmail}' == 'selenium+03-15-22.12.47.04.1647373624@trifectanutrition.com'
                            ${testCaseEmail} =        Generate New eMail Address
                            Log                       ${testCaseEmail}
  END
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Click Element             ${firstNameField}
  Input Text                ${firstNameField}         ${firstName}
  Click Element             ${lastNameField}
  Input Text                ${lastNameField}          ${lastName}
  Click Element             ${emailField}
  Input Text                ${emailField}             ${testCaseEmail}
  Click Element             ${passwordField}
  Input Text                ${passwordField}          ${password}
  Click Element             ${passwordConfirmField}
  Input Text                ${passwordConfirmField}   ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn} 
  
Generate New eMail Address
  [Documentation]
  ...   This creates a unique eMail based on DateTime
  ${currentDate}=           Get Current Date              result_format=%m-%d-%y.%H.%M.%S.%s
  ${generatedEmail}         Set Variable                  selenium+${currentDate}\@trifectanutrition.com
  [Return]                  ${generatedEmail}

Create An Account From OverLay
  Click Element             ${createAccountOLBtn}
