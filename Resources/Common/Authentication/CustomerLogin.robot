*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${loginEmailField}          id = email
${loginPassField}           id = pass
${password}                 F4rF4rAway

*** Keywords ***
Click Create An Account Button
  Wait Until Page Contains  Customer Login
  Click Link                Create an Account

Login As Registered Customer
  Wait Until Page Contains  Customer Login
  Click Element             ${loginEmailField}
  Input Text                ${loginEmailField}  ${TEST_EMAIL}
  Log                       ${TEST_EMAIL}
  Click Element             ${loginPassField} 
  Input Text                ${loginPassField}   ${password}
  Click Button              Sign In
  Wait Until Page Contains  Log Out
  Sleep                     2s 


