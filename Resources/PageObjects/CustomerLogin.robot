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
  [Arguments]                 ${CREATED_EMAIL}    ${password}
  Wait Until Page Contains    Customer Login
  Click Element               ${loginEmailField}
  Input Text                  ${loginEmailField}  ${CREATED_EMAIL}
  Log                         ${CREATED_EMAIL}
  Click Element               ${loginPassField} 
  Input Text                  ${loginPassField}   ${password}
  Click Button                Sign In
  Wait Until Page Contains    Log Out
  Sleep                       2s 