*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN MENU
${mainMenuBtnAndroid}                          //android.widget.ImageButton[@content-desc="Navigate up"]
${closeMainMenuBtnAndroid}                     id=com.n_ix.pocket_wod:id/closeBtn
${accountBtnAndroid}                           id=com.n_ix.pocket_wod:id/accountSideMenuItem
${myFeedsBtnAndroid}                           id=com.n_ix.pocket_wod:id/feedsSideMenuItem
${savedBtnAndroid}                             id=com.n_ix.pocket_wod:id/savedSideMenuItem
${helpBtnAndroid}                              id=com.n_ix.pocket_wod:id/helpSideMenuItem
${fitnessTimersBtnAndroid}                     id=com.n_ix.pocket_wod:id/fitnessTimerSideMenuItem
${workoutLogBtnAndroid}                        id=com.n_ix.pocket_wod:id/workoutLogSideMenuItem
${movementLogBtnAndroid}                       id=com.n_ix.pocket_wod:id/movementLogSideMenuItem
${privacyPolicyBtnAndroid}                     id=com.n_ix.pocket_wod:id/privacyPolicySideMenuItem
${termsOfServiceBtnAndroid}                    id=com.n_ix.pocket_wod:id/termsOfServiceSideMenuItem
${premiumSubscriptionInformationBtnAndroid}    id=com.n_ix.pocket_wod:id/SubscriptionInfoSideMenuItem
${yourCaliforniaPrivacyRightsBtnAndroid}       id-com.n_ix.pocket_wod:id/californiaRightsSideMenuItem
${doNotSellMyPersonalInformationBtnAndroid}    id=com.n_ix.pocket_wod:id/doNotSellPersonalInfoSideMenuItem
${logoutBtnAndroid}                            id=com.n_ix.pocket_wod:id/logOutBtn
${subscribeToPremiumBtnAndroid}                id=com.n_ix.pocket_wod:id/premiumSubscriptionBtn
${closeWebViewBtnAndroid}                      id=com.n_ix.pocket_wod:id/closeButton
${privacyBodyTxtAndroid}                       //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout
...                                            /android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout
...                                            /android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView
...                                            /android.webkit.WebView/android.view.View/android.view.View/android.view.View
...                                            /android.view.View/android.view.View/android.widget.TextView[1]
${termsOfServiceBodyTxtAndroid}                //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout
...                                            /android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout
...                                            /android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView
...                                            /android.webkit.WebView/android.view.View/android.view.View/android.view.View
...                                            /android.view.View/android.view.View/android.widget.TextView[1]
${premiumSubscriptionBodyTxtAndroid}           xpath=//XCUIElementTypeStaticText[@name="Premium Subscription Information"]
${californiaPrivacyRightsBodyTxtAndroid}       xpath=//XCUIElementTypeStaticText[@name="IMPORTANT PRIVACY NOTICE FOR CALIFORNIA CONSUMERS"]
${doNotSellMyInformationBodyTxtAndroid}        xpath=//XCUIElementTypeStaticText[@name="Trifecta Nutrition, Inc.’s CCPA"]

#ACCOUNT
${backBtnAccountAndroid}      //android.widget.ImageButton[@content-desc="Navigate up"]
${logOutAccountBtnAndroid}    id=com.n_ix.pocket_wod:id/logoutBtn
${cameraBtnAndroid}           id=com.n_ix.pocket_wod:id/profileImageView
${accountTxtAndroid}          id=com.n_ix.pocket_wod:id/myAccountLabel
${nameFieldAndroid}             id=com.n_ix.pocket_wod:id/usernameLabelView
${emailFieldAndroid}            id=com.n_ix.pocket_wod:id/activity_account_email
${genderFieldAndroid}           id=com.n_ix.pocket_wod:id/gender_spinner
${birthDateFieldAndroid}        id=com.n_ix.pocket_wod:id/birthday_text_view
${weightFieldAndroid}           id=com.n_ix.pocket_wod:id/weight_text_view
${heightFieldAndroid}           id=com.n_ix.pocket_wod:id/height_text_view
${ketoDietFieldAndroid}         id=com.n_ix.pocket_wod:id/keto_spinner
${nutritionGoalFieldAndroid}    id=com.n_ix.pocket_wod:id/nutrition_goal_spinner
${activityLevelTxtAndroid}    id=com.n_ix.pocket_wod:id/activity_level_spinner
${resetPasswordBtnAndroid}    id=com.n_ix.pocket_wod:id/resetPasswordBtn
${okLinkSentBtnAndroid}       id=com.n_ix.pocket_wod:id/okButton

*** Keywords ***

Open Main Menu Android
    Wait Until Element Is Visible    ${mainMenuBtnAndroid}    timeout=20
    Click Element                    ${mainMenuBtnAndroid}

Close Main Menu Android
    Wait Until Element Is Visible    ${closeMainMenuBtnAndroid}    timeout=20
    Click Element                    ${closeMainMenuBtnAndroid}

Open User Account Android
    Wait Until Element Is Visible    ${accountBtnAndroid}    timeout=20
    Click Element                    ${accountBtnAndroid}

Close User Account Android
    Wait Until Element Is Visible    ${backBtnAccountAndroid}
    Click Element                    ${backBtnAccountAndroid}

Log Out Android
    @{list}=    Create List    ${mainMenuBtnAndroid}   
    ...                        ${accountBtnAndroid}
    ...                        ${accountLogoutBtnAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element     ${item}
    END

Review Main Menu UI Android
    Open Main Menu Android
    @{list}=    Create List    ${accountBtnAndroid}
    ...                        ${myFeedsBtnAndroid}
    ...                        ${savedBtnAndroid}
    ...                        ${helpBtnAndroid}
    ...                        ${fitnessTimersBtnAndroid}
    ...                        ${workoutLogBtnAndroid}
    ...                        ${movementLogBtnAndroid}
    FOR    ${item}    IN    @{list}
        Element Should Be Visible   ${item}    timeout=20
    END
    Scroll Down                   ${logoutBtnAndroid}
    @{list}=    Create List       ${privacyPolicyBtnAndroid}
    ...                           ${termsOfServiceBtnAndroid}
    ...                           ${premiumSubscriptionInformationBtnAndroid}
    ...                           ${yourCaliforniaPrivacyRightsBtnAndroid}
    ...                           ${doNotSellMyPersonalInformationBtnAndroid}
    ...                           ${logoutBtnAndroid}
    ...                           ${subscribeToPremiumBtnAndroid}
    FOR    ${item}    IN    @{list}
        Element Should Be Visible   ${item}    timeout=20
    END
    Close Main Menu Android

Review User Account UI Android
    Open Main Menu Android
    Open User Account Android
    @{list}=    Create List    ${cameraBtnAndroid}
    ...                        ${accountTxtAndroid}
    ...                        ${cameraBtnAndroid}
    ...                        ${accountTxtAndroid}
    ...                        ${nameFieldAndroid}
    ...                        ${emailFieldAndroid}
    ...                        ${genderFieldAndroid}
    ...                        ${birthDateFieldAndroid}
    ...                        ${weightFieldAndroid}
    ...                        ${heightFieldAndroid}
    ...                        ${ketoDietFieldAndroid}
    ...                        ${nutritionGoalFieldAndroid}
    ...                        ${activityLevelTxtAndroid}
    FOR    ${item}    IN    @{list}
        Wait Until Element Is Visible   ${item}    timeout=20
    END
    Close User Account Android
    Close Main Menu Android

Reset User Password Android
    Open Main Menu Android
    Open User Account Android
    Scroll Down                      ${resetPasswordBtnAndroid}
    Click Element                    ${resetPasswordBtnAndroid}
    Wait Until Element Is Visible    ${okLinkSentBtnAndroid}
    Click Element                    ${okLinkSentBtnAndroid}
    Close User Account Android
    Close Main Menu Android

Update User Name Android
    [Arguments]                      ${userName}
    Open Main Menu Android
    Open User Account Android
    Wait Until Element Is Visible    ${nameFieldAccountAndroid}
    Clear Text                       ${nameFieldAccountAndroid}
    Input Text                       ${nameFieldAccountAndroid}    ${userName}
    Close User Account Android
    Close Main Menu Android
    Open Main Menu Android
    Open User Account Android
    Wait Until Element Is Visible     ${nameFieldAccountAndroid}
    Element Should Contain Text       ${nameFieldAccountAndroid}    ${userName}
    Close User Account Android
    Close Main Menu Android

Review Privacy Policy Android
    Open Main Menu Android
    Click Element                    ${privacyPolicyBtnAndroid}
    Wait Until Element Is Visible    ${privacyBodyTxtAndroid}     timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Terms Of Service Android
    Open Main Menu Android
    Click Element                    ${termsOfServiceBtnAndroid}
    Wait Until Element Is Visible    ${termsOfServiceBodyTxtAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Premium Subscription Information Android
    Open Main Menu Android
    Scroll Down                      ${premiumSubscriptionInformationBtnAndroid} 
    Click Element                    ${premiumSubscriptionInformationBtnAndroid} 
    Wait Until Element Is Visible    ${premiumSubscriptionBodyTxtAndroid}     timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Your California Privacy Rights Android
    Open Main Menu Android
    Scroll Down                      ${yourCaliforniaPrivacyRightsBtnAndroid} 
    Click Element                    ${yourCaliforniaPrivacyRightsBtnAndroid} 
    Wait Until Element Is Visible    ${californiaPrivacyRightsBodyTxtAndroid}     timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Do Not Sell My Information Android
    Open Main Menu Android
    Scroll Down                      ${doNotSellMyPersonalInformationBtnAndroid}
    Click Element                    ${doNotSellMyPersonalInformationBtnAndroid}
    Wait Until Element Is Visible    ${doNotSellMyInformationBodyTxtAndroid}     timeout=20
    Click Element                    ${closeWebViewBtnAndroid}