*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${emailField1}              id = email
${passwordField1}           id = pass
${password}                 F4rF4rAway

*** Keywords ***
Click Create An Account Button
  Wait Until Page Contains  Customer Login
  Click Link                Create an Account

Login As Registered Customer
  Wait Until Page Contains  Customer Login
  Click Element             ${emailField1}
  Input Text                ${emailField1}      ${TEST_EMAIL}
  Log                       ${TEST_EMAIL}
  Click Element             ${passwordField1} 
  Input Text                ${passwordField1}   ${password}
  Click Button              Sign In
  Wait Until Page Contains  My Account
  Sleep                     2s 


