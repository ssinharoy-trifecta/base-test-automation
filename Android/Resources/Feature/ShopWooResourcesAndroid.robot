*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${shopBtnAndroid}                  id=com.n_ix.pocket_wod:id/shop
${shopCloseBtnAndroid}             id=com.n_ix.pocket_wod:id/closeButton
${shopBackBtnAndroid}              id=com.n_ix.pocket_wod:id/backButton
${dashboardBtnAndroid}             xpath=//android.view.View[@content-desc=\"Dashboard\"]/android.widget.TextView
${modifyBtnAndroid}                xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.Button

*** Keywords ***

Open Shop Android
    Wait Until Element Is Visible        ${shopBtnAndroid}    timeout=30
    Click Element                        ${shopBtnAndroid}

Validadate Dashboard UI And Details Android
    @{list}=    Create List    ${dashboardBtnAndroid}
    ...                        ${modifyBtnAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
    END

Close Shop Android
    Wait Until Element Is Visible        ${shopCloseBtnAndroid}
    Click Element                        ${shopCloseBtnAndroid}
    