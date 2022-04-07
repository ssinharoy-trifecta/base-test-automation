*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${mainMenuBtnAndroid}    //android.widget.ImageButton[@content-desc="Navigate up"]
${accountBtnAndroid}     id=com.n_ix.pocket_wod:id/valueTextView
${logoutBtnAndroid}      id=com.n_ix.pocket_wod:id/logoutBtn

*** Keywords ***

Log Out Android
    Wait Until Element Is Visible    ${mainMenuBtnAndroid}    timeout=5
    Click Element                    ${mainMenuBtnAndroid}
    Wait Until Element Is Visible    ${accountBtnAndroid}   timeout=5
    Click Element                    ${accountBtnAndroid}
    Wait Until Element Is Visible    ${logoutBtnAndroid}   timeout=5
    Click Element                    ${logoutBtnAndroid}