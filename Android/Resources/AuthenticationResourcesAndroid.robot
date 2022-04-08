*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${testUserEmail}       trifectatester2@gmail.com
${testUserPassword}    tester123

${getStartedBtnAndroid}    id=com.n_ix.pocket_wod:id/getStartedButton
${emailFieldAndroid}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.EditText
${passwordFieldAndroid}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText
${signInBtnAndroid}        id=com.n_ix.pocket_wod:id/signInButton

*** Keywords ***

Sign In As Existing User Android
    Wait Until Element Is Visible    ${getStartedBtnAndroid}    timeout=30
    Click Element                    ${getStartedBtnAndroid}
    Wait Until Element Is Visible    ${emailFieldAndroid}    timeout=30
    Input Text                       ${emailFieldAndroid}    ${testUserEmail}
    Input Text                       ${passwordFieldAndroid}    ${testUserPassword}
    Click Element                    ${signInBtnAndroid}