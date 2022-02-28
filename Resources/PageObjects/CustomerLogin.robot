*** Settings ***
Library                     SeleniumLibrary
Library                     DateTime
Library                     BuiltIn

*** Variables ***
${emailField1}              id = email
${email}                    eldenring1@trifecta.com
${passwordField1}           id = pass
${password}                 Password1

*** Keywords ***
Click Create An Account Button
  Wait Until Page Contains  Customer Login
  Click Link                Create an Account

Login As Registered Customer
  Wait Until Page Contains  Customer Login
  Click Element             ${emailField1}
  Input Text                ${emailField1}      ${email}
  Click Element             ${passwordField1} 
  Input Text                ${passwordField1}   ${password}
  Click Button              Sign In
  Wait Until Page Contains  My Account


