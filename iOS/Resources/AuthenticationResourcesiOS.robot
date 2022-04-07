*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${testUserEmail}       trifectatester2@gmail.com
${testUserPassword}    tester123

${getStartedBtn}    xpath=//XCUIElementTypeButton[@name="Get Started"]
${emailField}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordField}    xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtn}        xpath=//XCUIElementTypeButton[@name="Sign in"]

${allowBtn}    xpath=//XCUIElementTypeButton[@name="Allow"]


*** Keywords ***

Check Data Alert
    Sleep             3
    ${alert}          Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtn}    timeout=10
    Run Keyword If    '${alert}' == 'False'    Click Element    ${allowBtn}

Sign In As Existing User
    Wait Until Element Is Visible    ${getStartedBtn}    timeout=30
    Click Element                    ${getStartedBtn}
    Wait Until Element Is Visible    ${emailField}    timeout=30
    Input Text                       ${emailField}    ${testUserEmail}
    Input Text                       ${passwordField}    ${testUserPassword}
    Click Element    ${signInBtn}

Check Notifications Alert
    Sleep             3
    ${alert2}         Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtn}    timeout=10
    Run Keyword If    '${alert2}' == 'False'    Click Element    ${allowBtn}