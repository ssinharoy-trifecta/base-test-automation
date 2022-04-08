*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${testUserEmail}       trifectatester2@gmail.com
${testUserPassword}    tester123

${getStartedBtniOS}    xpath=//XCUIElementTypeButton[@name="Get Started"]
${emailFieldiOS}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordFieldiOS}    xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtniOS}        xpath=//XCUIElementTypeButton[@name="Sign in"]

${allowBtniOS}    xpath=//XCUIElementTypeButton[@name="Allow"]


*** Keywords ***

Check Data Alert iOS
    Sleep             3
    ${alertiOS}       Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=10
    Run Keyword If    '${alertiOS}' == 'False'    Click Element    ${allowBtniOS}

Sign In As Existing User iOS
    Wait Until Element Is Visible    ${getStartedBtniOS}    timeout=30
    Click Element                    ${getStartedBtniOS}
    Wait Until Element Is Visible    ${emailFieldiOS}    timeout=30
    Input Text                       ${emailFieldiOS}    ${testUserEmail}
    Input Text                       ${passwordFieldiOS}    ${testUserPassword}
    Click Element                    ${signInBtniOS}

Check Notifications Alert iOS
    Sleep             3
    ${alert2iOS}      Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=10
    Run Keyword If    '${alert2iOS}' == 'False'    Click Element    ${allowBtniOS}