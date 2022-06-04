*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
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
    @{list}=    Create List                          ${getStartedBtnIntroiOS}    
    ...                                              ${createAccountBtnAuthenticationiOS}
    FOR                                              ${item}     IN     @{list}
        Wait Until Visible And Click Element Apps    ${item}
    END
    Wait Until Element Is Visible                    ${emailFieldAuthenticationiOS}   timeout=30
    ${date}    Get Current Date                      result_format=%m-%d-%y-%H.%M.%S
    Input Text                                       ${emailFieldAuthenticationiOS}   trifectaqa+${date}@gmail.com
    Input Text                                       ${passwordFieldAuthenticationiOS}    ${testUserPassword}
    Click Element                                    ${signUpBtnAuthenticationiOS}
    Wait Until Element Is Visible                    ${athleteImgOnboardingiOS}   
    Wait Until Element Is Visible                    ${welcomeToTrifectaTxtOnboardingiOS}

Sign In As Existing User iOS
    Wait Until Visible And Click Element Apps    ${getStartedBtnIntroiOS}
    Wait Until Element Is Visible                ${emailFieldAuthenticationiOS}
    Input Text                                   ${emailFieldAuthenticationiOS}   ${testUserEmail}
    Input Text                                   ${passwordFieldAuthenticationiOS}    ${testUserPassword}
    Click Element                                ${signInBtnAuthenticationiOS}
