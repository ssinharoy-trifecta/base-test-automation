*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${loginEmailField}            id = email
${loginPassField}             id = pass

*** Keywords ***
Click Create An Account Button
  Wait Until Page Contains    Customer Login
  Click Link                  Create an Account

Login As Registered Customer
  [Arguments]                 ${customerInfo}
  Wait Until Page Contains    Customer Login
  Input Text                  ${loginEmailField}  ${customerInfo}[2]
  Input Text                  ${loginPassField}   ${customerInfo}[3]
  Click Button                Sign In
  Wait Until Page Contains    Log Out
