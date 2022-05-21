*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN MENU
${mainMenuBtnAndroid}                          //android.widget.ImageButton[@content-desc="Navigate up"]
${mainMenuBtn2Android}                         //android.widget.ImageButton[@content-desc="Open navigation drawer"]
${closeMainMenuBtnAndroid}                     //android.widget.ImageButton[@content-desc="Close navigation drawer"]
${menuItemPrefixAndroid}                       //android.widget.FrameLayout/android.widget.LinearLayout
...                                            /android.widget.FrameLayout/android.widget.LinearLayout
...                                            /android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout
...                                            /android.widget.FrameLayout[1]/android.widget.LinearLayout
...                                            /androidx.compose.ui.platform.ComposeView/android.view.View
...                                            /android.widget.ScrollView/android.view.View[
${menuItemSuffixAndroid}                       ]/android.view.View
${accountBtnAndroid}                           ${menuItemPrefixAndroid}3${menuItemSuffixAndroid}
${myFeedsBtnAndroid}                           ${menuItemPrefixAndroid}4${menuItemSuffixAndroid}
${savedBtnAndroid}                             ${menuItemPrefixAndroid}5${menuItemSuffixAndroid}
${helpBtnAndroid}                              ${menuItemPrefixAndroid}6${menuItemSuffixAndroid}
${fitnessTimersBtnAndroid}                     ${menuItemPrefixAndroid}8${menuItemSuffixAndroid}
${workoutLogBtnAndroid}                        ${menuItemPrefixAndroid}9${menuItemSuffixAndroid}
${movementLogBtnAndroid}                       ${menuItemPrefixAndroid}10${menuItemSuffixAndroid}
${privacyPolicyBtnAndroid}                     ${menuItemPrefixAndroid}12${menuItemSuffixAndroid}
${termsOfServiceBtnAndroid}                    ${menuItemPrefixAndroid}13${menuItemSuffixAndroid}
${premiumSubscriptionInformationBtnAndroid}    ${menuItemPrefixAndroid}14${menuItemSuffixAndroid}
${yourCaliforniaPrivacyRightsBtnAndroid}       ${menuItemPrefixAndroid}15${menuItemSuffixAndroid}
${doNotSellMyPersonalInformationBtnAndroid}    ${menuItemPrefixAndroid}16${menuItemSuffixAndroid}
${logoutBtnAndroid}                            id=com.n_ix.pocket_wod:id/logOutBtn
${subscribeToPremiumBtnAndroid}                id=com.n_ix.pocket_wod:id/premiumSubscriptionBtn
${closeWebViewBtnAndroid}                      id=com.n_ix.pocket_wod:id/closeButton
${webViewTextElementAndroid}                   //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout
...                                            /android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout
...                                            /android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView
...                                            /android.webkit.WebView/android.view.View/android.view.View/android.view.View
...                                            /android.view.View/android.view.View/android.widget.TextView[1]
${premiumSubscriptionBodyTxtAndroid}           xpath=//XCUIElementTypeStaticText[@name="Premium Subscription Information"]
${californiaPrivacyRightsBodyTxtAndroid}       xpath=//XCUIElementTypeStaticText[@name="IMPORTANT PRIVACY NOTICE FOR CALIFORNIA CONSUMERS"]
${doNotSellMyInformationBodyTxtAndroid}        xpath=//XCUIElementTypeStaticText[@name="Trifecta Nutrition, Inc.’s CCPA"]

#ACCOUNT
${backBtnAccountAndroid}               //android.widget.ImageButton[@content-desc="Navigate up"]
${logOutBtnAccountAndroid}             id=com.n_ix.pocket_wod:id/logoutBtn
${cameraBtnAccountAndroid}             id=com.n_ix.pocket_wod:id/profileImageView
${accountTxtAccountAndroid}            id=com.n_ix.pocket_wod:id/myAccountLabel
${nameFieldAccountAndroid}             id=com.n_ix.pocket_wod:id/usernameLabelView
${genderFieldAccountAndroid}           id=com.n_ix.pocket_wod:id/gender_spinner
${birthDateFieldAccountAndroid}        id=com.n_ix.pocket_wod:id/birthday_text_view
${weightFieldAccountAndroid}           id=com.n_ix.pocket_wod:id/weight_text_view
${heightFieldAccountAndroid}           id=com.n_ix.pocket_wod:id/height_text_view
${ketoDietFieldAccountAndroid}         id=com.n_ix.pocket_wod:id/keto_spinner
${nutritionGoalFieldAccountAndroid}    id=com.n_ix.pocket_wod:id/nutrition_goal_spinner
${activityLevelTxtAccountAndroid}      id=com.n_ix.pocket_wod:id/activity_level_spinner
${resetPasswordBtnAccountAndroid}      id=com.n_ix.pocket_wod:id/resetPasswordBtn
${okLinkSentBtnAccountAndroid}         id=com.n_ix.pocket_wod:id/okButton

*** Keywords ***

Open Main Menu First Time After Login Android
    Wait Until Element Is Visible    ${mainMenuBtnAndroid}    timeout=20
    Click Element                    ${mainMenuBtnAndroid}

Open Main Menu Android
    Wait Until Element Is Visible    ${mainMenuBtn2Android}    timeout=20
    Click Element                    ${mainMenuBtn2Android}

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
    Open Main Menu Android
    Open User Account Android
    Wait Until Element Is Visible    ${logOutBtnAccountAndroid}    timeout=10
    Click Element                    ${logOutBtnAccountAndroid}

Review Main Menu UI Android
    Open Main Menu Android
    @{list}=    Create List    ${accountBtnAndroid}
    ...                        ${myFeedsBtnAndroid}
    ...                        ${savedBtnAndroid}
    ...                        ${helpBtnAndroid}
    ...                        ${fitnessTimersBtnAndroid}
    ...                        ${workoutLogBtnAndroid}
    ...                        ${movementLogBtnAndroid}
    ...                        ${privacyPolicyBtnAndroid}
    ...                        ${termsOfServiceBtnAndroid}
    ...                        ${premiumSubscriptionInformationBtnAndroid}
    ...                        ${yourCaliforniaPrivacyRightsBtnAndroid}
    ...                        ${doNotSellMyPersonalInformationBtnAndroid}
    FOR    ${item}    IN    @{list}
        Wait Until Page Contains Element   ${item}    timeout=20
    END
    Close Main Menu Android

Review User Account UI Android
    Open Main Menu Android
    Open User Account Android
    @{list}=    Create List    ${cameraBtnAccountAndroid}
    ...                        ${accountTxtAccountAndroid}
    ...                        ${nameFieldAccountAndroid}
    ...                        ${emailFieldAccountAndroid}
    ...                        ${genderFieldAccountAndroid}
    ...                        ${birthDateFieldAccountAndroid}
    ...                        ${weightFieldAccountAndroid}
    ...                        ${heightFieldAccountAndroid}
    ...                        ${ketoDietFieldAccountAndroid}
    ...                        ${nutritionGoalFieldAccountAndroid}
    ...                        ${activityLevelTxtAccountAndroid}
    FOR    ${item}    IN    @{list}
        Wait Until Element Is Visible   ${item}    timeout=20
    END
    Close User Account Android

Reset User Password Android
    Open Main Menu Android
    Open User Account Android
    Wait Until Element Is Visible    ${resetPasswordBtnAccountAndroid}
    Click Element                    ${resetPasswordBtnAccountAndroid}
    Wait Until Element Is Visible    ${okLinkSentBtnAccountAndroid}
    Click Element                    ${okLinkSentBtnAccountAndroid}
    Close User Account Android

Review Privacy Policy Android
    Open Main Menu Android
    Click Text                       Privacy policy    exact_match=True
    Wait Until Element Is Visible    ${webViewTextElementAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Terms Of Service Android
    Open Main Menu Android
    Click Text                       Terms of service    exact_match=True
    Wait Until Element Is Visible    ${webViewTextElementAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Premium Subscription Information Android
    Open Main Menu Android
    Click Text                       Premium subscription information    exact_match=True
    Wait Until Element Is Visible    ${webViewTextElementAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Your California Privacy Rights Android
    Open Main Menu Android
    Click Text                       Your California privacy rights    exact_match=True
    Wait Until Element Is Visible    ${webViewTextElementAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}

Review Do Not Sell My Information Android
    Open Main Menu Android
    Click Text                       Do not sell my personal information    exact_match=True
    Wait Until Element Is Visible    ${webViewTextElementAndroid}    timeout=20
    Click Element                    ${closeWebViewBtnAndroid}
