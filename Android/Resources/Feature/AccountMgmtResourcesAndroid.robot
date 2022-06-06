*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN MENU
${mainMenuBtnOnAppLoadAndroid}                 //android.widget.ImageButton[@content-desc="Navigate up"]
#Main Menu button locator changes when opened once
${mainMenuBtnAndroid}                          //android.widget.ImageButton[@content-desc="Open navigation drawer"]
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
${emailFieldAccountAndroid}            id=com.n_ix.pocket_wod:id/activity_account_email
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

Open User Account Android
    CommonApps.Wait Until Visible And Click Element Apps    ${mainMenuBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${accountBtnAndroid}

Log Out Android
    Open User Account Android
    CommonApps.Wait Until Visible And Click Element Apps    ${logOutBtnAccountAndroid}

#TODO: Improve this test case by adding more UI validation points
Review Main Menu UI Android
    CommonApps.Wait Until Visible And Click Element Apps    ${mainMenuBtnAndroid}
    @{list}=    Create List                                 ${accountBtnAndroid}
    ...                                                     ${myFeedsBtnAndroid}
    ...                                                     ${savedBtnAndroid}
    ...                                                     ${helpBtnAndroid}
    ...                                                     ${fitnessTimersBtnAndroid}
    ...                                                     ${workoutLogBtnAndroid}
    ...                                                     ${movementLogBtnAndroid}
    ...                                                     ${privacyPolicyBtnAndroid}
    ...                                                     ${termsOfServiceBtnAndroid}
    ...                                                     ${premiumSubscriptionInformationBtnAndroid}
    ...                                                     ${yourCaliforniaPrivacyRightsBtnAndroid}
    ...                                                     ${doNotSellMyPersonalInformationBtnAndroid}
    FOR                                                     ${item}    IN    @{list}
        Wait Until Page Contains Element                    ${item}
    END
    CommonApps.Wait Until Visible And Click Element Apps    ${closeMainMenuBtnAndroid}

Review User Account UI Android
    Open User Account Android
    @{list}=    Create List                                 ${cameraBtnAccountAndroid}
    ...                                                     ${accountTxtAccountAndroid}
    ...                                                     ${nameFieldAccountAndroid}
    ...                                                     ${emailFieldAccountAndroid}
    ...                                                     ${genderFieldAccountAndroid}
    ...                                                     ${birthDateFieldAccountAndroid}
    ...                                                     ${weightFieldAccountAndroid}
    ...                                                     ${heightFieldAccountAndroid}
    ...                                                     ${ketoDietFieldAccountAndroid}
    ...                                                     ${nutritionGoalFieldAccountAndroid}
    ...                                                     ${activityLevelTxtAccountAndroid}
    FOR                                                     ${item}    IN    @{list}
        Wait Until Element Is Visible                       ${item}
    END
    CommonApps.Wait Until Visible And Click Element Apps    ${backBtnAccountAndroid}

Reset User Password Android
    Open User Account Android
    @{list}=    Create List                                    ${resetPasswordBtnAccountAndroid}
    ...                                                        ${okLinkSentBtnAccountAndroid}
    ...                                                        ${backBtnAccountAndroid}
    FOR                                                        ${item}    IN    @{list}
        CommonApps.Wait Until Visible And Click Element Apps   ${item}
    END

Review Info WebView Android
    [Arguments]                                             ${typeInfoBtnName}
    CommonApps.Wait Until Visible And Click Element Apps    ${mainMenuBtnAndroid}
    Click Text                                              ${typeInfoBtnName}    exact_match=True
    Wait Until Element Is Visible                           ${webViewTextElementAndroid}
    Click Element                                           ${closeWebViewBtnAndroid}
