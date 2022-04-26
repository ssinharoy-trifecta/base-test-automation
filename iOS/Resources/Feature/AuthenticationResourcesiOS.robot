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
${emailFieldAuthenticationiOS}          xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordFieldAuthenticationiOS}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtnAuthenticationiOS}           xpath=//XCUIElementTypeButton[@name="Sign in"]
${createAccountBtnAuthenticationiOS}    xpath=//XCUIElementTypeButton[@name="New to Trifecta? Create Account"]
${signUpBtnAuthenticationiOS}           xpath=//XCUIElementTypeButton[@name="Sign up"]

*** Keywords ***

Sign Up As New User iOS
    @{list}=    Create List    ${getStartedBtnIntroiOS}    
    ...                        ${createAccountBtnAuthenticationiOS}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element     ${item}
    END
    Wait Until Element Is Visible    ${emailFieldAuthenticationiOS}   timeout=30
    ${date}                          Get Current Date   result_format=%m-%d-%y-%H.%M.%S
    Input Text                       ${emailFieldAuthenticationiOS}   trifectaqa+${date}@gmail.com
    Input Text                       ${passwordFieldAuthenticationiOS}    ${testUserPassword}
    Click Element                    ${signUpBtnAuthenticationiOS}
    @{list}=    Create List    ${athleteImgOnboardingiOS}   
    ...                        ${welcomeToTrifectaTxtOnboardingiOS}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
    END

Sign In As Existing User iOS
    Wait Until Element Is Visible    ${getStartedBtnIntroiOS}    timeout=30
    Click Element                    ${getStartedBtnIntroiOS}
    Wait Until Element Is Visible    ${emailFieldAuthenticationiOS}   timeout=30
    Input Text                       ${emailFieldAuthenticationiOS}   ${testUserEmail}
    Input Text                       ${passwordFieldAuthenticationiOS}    ${testUserPassword}
    Click Element                    ${signInBtnAuthenticationiOS}
    