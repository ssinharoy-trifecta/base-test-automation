*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${mainMenuBtnAndroid}    //android.widget.ImageButton[@content-desc="Navigate up"]
${accountBtnAndroid}     id=com.n_ix.pocket_wod:id/valueTextView
${logoutBtnAndroid}      id=com.n_ix.pocket_wod:id/logoutBtn

*** Keywords ***

Log Out Android
    @{list}=    Create List    ${mainMenuBtnAndroid}   
    ...                        ${accountBtnAndroid}
    ...                        ${logoutBtnAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element     ${item}
    END