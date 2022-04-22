*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

#EXISTING PREMIUM USER CREDENTIALS
${testUserEmail}       trifectaqa@gmail.com
${testUserPassword}    tester123

#AUTENTICATION SCREEN OBJECTS
${getStartedBtniOS}       xpath=//XCUIElementTypeButton[@name="Get Started"]
${emailFieldiOS}          xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordFieldiOS}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtniOS}           xpath=//XCUIElementTypeButton[@name="Sign in"]
${createAccountBtniOS}    xpath=//XCUIElementTypeButton[@name="New to Trifecta? Create Account"]
${signUpBtniOS}           xpath=//XCUIElementTypeButton[@name="Sign up"]

#iOS NATIVE OBJECTS
${allowBtniOS}    xpath=//XCUIElementTypeButton[@name="Allow"]

*** Keywords ***

Check Data Alert iOS
    Sleep             3
    ${alertiOS}       Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=3
    Run Keyword If    '${alertiOS}' == 'False'    Click Element    ${allowBtniOS}

Sign Up As New User iOS
    Wait Until Element Is Visible    ${getStartedBtniOS}    timeout=30
    Click Element                    ${getStartedBtniOS}
    Wait Until Element Is Visible    ${createAccountBtniOS}    timeout=30
    Click Element                    ${createAccountBtniOS}
    Wait Until Element Is Visible    ${emailFieldiOS}   timeout=30
    ${date}                          Get Current Date   result_format=%m-%d-%y-%H.%M.%S
    Input Text                       ${emailFieldiOS}   trifectaqa+${date}@gmail.com
    Input Text                       ${passwordFieldiOS}    ${testUserPassword}
    Click Element                    ${signUpBtniOS}
    Wait Until Element Is Visible    ${OnboardingImgiOS}    timeout=30
    Wait Until Element Is Visible    ${WelcomeToTrifectaTxtiOS}    timeout=30

Sign In As Existing User iOS
    Wait Until Element Is Visible    ${getStartedBtniOS}    timeout=30
    Click Element                    ${getStartedBtniOS}
    Wait Until Element Is Visible    ${emailFieldiOS}   timeout=30
    Input Text                       ${emailFieldiOS}   ${testUserEmail}
    Input Text                       ${passwordFieldiOS}    ${testUserPassword}
    Click Element                    ${signInBtniOS}

Check Notifications Alert iOS
    Sleep             3
    ${alert2iOS}      Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=3
    Run Keyword If    '${alert2iOS}' == 'False'    Click Element    ${allowBtniOS}
