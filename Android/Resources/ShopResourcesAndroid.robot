*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${shopBtn}                  id=com.n_ix.pocket_wod:id/shop
${shopCloseBtn}             id=com.n_ix.pocket_wod:id/closeButton
${shopBackBtn}              id=com.n_ix.pocket_wod:id/backButton
${dashboardBtn}             xpath=//android.view.View[@content-desc=\"Dashboard\"]/android.widget.TextView
${modifyBtn}                xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.Button


*** Keywords ***

Open Shop
    Wait Until Element Is Visible        ${shopBtn}    timeout=30
    Click Element                        ${shopBtn}

Validadate Dashboard UI And Details
    Wait Until Page Contains Element     ${dashboardBtn}    timeout=30
    Page Should Contain Element          ${dashboardBtn}
    Wait Until Page Contains Element     ${modifyBtn}    timeout=30
    Page Should Contain Element          ${modifyBtn}

Close Shop
    Wait Until Element Is Visible        ${shopCloseBtn}
    Click Element                        ${shopCloseBtn}