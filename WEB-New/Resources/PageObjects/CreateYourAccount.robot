*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${emailField}                id = billing_email
${passwordField}             id = account_password
${passwordConfirmField}      id = account_password-2
${createAccountContinueBtn}  id = proceed-to-step-3
${existingEmailPopupField}   id = checkout-login-email
${existingPasswordPopupField}

*** Keywords ***
Generate New Email Address
  [Documentation]
  ...   This creates a unique eMail based on DateTime
  ${currentDate}=           Get Current Date              result_format=%m-%d-%y.%H.%M.%S.%s
  ${generatedEmail}         Set Variable                  selenium+${currentDate}\@trifectanutrition.com
  [Return]                  ${generatedEmail}


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
  ...                       ${customerInfo}
  IF                        '${customerInfo.email}' == 'selenium+default@trifectanutrition.com'
                            ${customerInfo.email} =   Generate New eMail Address
                            Log                       ${customerInfo.email}
  END
  Wait Until Page Contains  ${createValidationText}
  #Input form
  Input Text                ${firstNameField}         ${firstName}
  Input Text                ${lastNameField}          ${lastName}
  Input Text                ${emailField}             ${customerInfo.email}
  Input Text                ${passwordField}          ${password}
  Input Text                ${passwordConfirmField}   ${password}
  Sleep                     2s
  Click Button              ${createAccountBtn}
  #Assign value to customerInfo list
  [Return]                  ${customerInfo}

Generate New eMail Address
  [Documentation]
  ...   This creates a unique eMail based on DateTime
  ${currentDate}=           Get Current Date              result_format=%m-%d-%y.%H.%M.%S.%s
  ${generatedEmail}         Set Variable                  selenium+${currentDate}\@trifectanutrition.com
  [Return]                  ${generatedEmail}

Create An Account From OverLay
  Click Element             ${createAccountOLBtn}

