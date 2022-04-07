*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${testUserEmail}       trifectatester2@gmail.com
${testUserPassword}    tester123

${getStartedBtn}    id=com.n_ix.pocket_wod:id/getStartedButton
${emailField}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.EditText
${passwordField}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText
${signInBtn}        id=com.n_ix.pocket_wod:id/signInButton

*** Keywords ***

Sign In As Existing User
    Wait Until Element Is Visible    ${getStartedBtn}    timeout=30
    Click Element                    ${getStartedBtn}
    Wait Until Element Is Visible    ${emailField}    timeout=30
    Input Text                       ${emailField}    ${testUserEmail}
    Input Text                       ${passwordField}    ${testUserPassword}
    Click Element                    ${signInBtn}