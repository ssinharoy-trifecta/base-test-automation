*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    SeleniumLibrary
Library    DateTime

*** Variables ***

#EXISTING PREMIUM USER CREDENTIALS
${testUserEmail}       trifectaqa@gmail.com
${testUserPassword}    tester123

#AUTHENTICATION SCREEN OBJECTS
${getStartedBtnAndroid}       id=com.n_ix.pocket_wod:id/getStartedButton
${emailFieldAndroid}          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.EditText
${passwordFieldAndroid}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText
${signInBtnAndroid}           id=com.n_ix.pocket_wod:id/signInButton
${createAccountBtnAndroid}    id=com.n_ix.pocket_wod:id/createAccountLink
${signUpBtnAndroid}           id=com.n_ix.pocket_wod:id/signUpButton

*** Keywords ***

Sign Up As New User Android
    Wait Until Element Is Visible    ${getStartedBtnAndroid}    timeout=30
    Click Element                    ${getStartedBtnAndroid}
    Wait Until Element Is Visible    ${createAccountBtnAndroid}    timeout=30
    Click Element                    ${createAccountBtnAndroid}
    Wait Until Element Is Visible    ${emailFieldAndroid}   timeout=30
    ${date}                          Get Current Date   result_format=%m-%d-%y-%H.%M.%S
    Input Text                       ${emailFieldAndroid}   trifectaqa+${date}@gmail.com
    Input Text                       ${passwordFieldAndroid}    ${testUserPassword}
    Click Element                    ${signUpBtnAndroid}
    Wait Until Element Is Visible    ${athleteImgOnboardingAndroid}    timeout=30
    Wait Until Element Is Visible    ${welcomeToTrifectaTxtOnboardingAndroid}    timeout=30

Sign In As Existing User Android
    Wait Until Element Is Visible    ${getStartedBtnAndroid}    timeout=30
    Click Element                    ${getStartedBtnAndroid}
    Wait Until Element Is Visible    ${emailFieldAndroid}    timeout=30
    Input Text                       ${emailFieldAndroid}    ${testUserEmail}
    Input Text                       ${passwordFieldAndroid}    ${testUserPassword}
    Click Element                    ${signInBtnAndroid}