*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${mainMenuBtn}    //android.widget.ImageButton[@content-desc="Navigate up"]
${accountBtn}     id=com.n_ix.pocket_wod:id/valueTextView
${logoutBtn}      id=com.n_ix.pocket_wod:id/logoutBtn

*** Keywords ***

Log Out
    Wait Until Element Is Visible    ${mainMenuBtn}    timeout=5
    Click Element                    ${mainMenuBtn}
    Wait Until Element Is Visible    ${accountBtn}   timeout=5
    Click Element                    ${accountBtn}
    Wait Until Element Is Visible    ${logoutBtn}   timeout=5
    Click Element                    ${logoutBtn}