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
    Wait Until Page Contains Element     ${dashboardBtnAndroid}    timeout=30
    Page Should Contain Element          ${dashboardBtnAndroid}
    Wait Until Page Contains Element     ${modifyBtnAndroid}    timeout=30
    Page Should Contain Element          ${modifyBtnAndroid}

Close Shop Android
    Wait Until Element Is Visible        ${shopCloseBtnAndroid}
    Click Element                        ${shopCloseBtnAndroid}