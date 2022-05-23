*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN MENU
${mainMenuBtniOS}                          xpath=//XCUIElementTypeButton[@name="ic side menu"]
${closeMainMenuBtniOS}                     xpath=//XCUIElementTypeButton[@name="ic sideMenu close"]
${accountBtniOS}                           xpath=//XCUIElementTypeStaticText[@name="Account"]
${myFeedsBtniOS}                           xpath=//XCUIElementTypeStaticText[@name="My feeds"]
${savedBtniOS}                             xpath=//XCUIElementTypeStaticText[@name="Saved"]
${helpBtniOS}                              xpath=//XCUIElementTypeStaticText[@name="Help"]
${fitnessTimersBtniOS}                     xpath=//XCUIElementTypeStaticText[@name="Fitness timers"]
${workoutLogBtniOS}                        xpath=//XCUIElementTypeStaticText[@name="Workout log"]
${movementLogBtniOS}                       xpath=//XCUIElementTypeStaticText[@name="Movement log"]
${privacyPolicyBtniOS}                     xpath=//XCUIElementTypeStaticText[@name="Privacy policy"]
${termsOfServiceBtniOS}                    xpath=//XCUIElementTypeStaticText[@name="Terms of service"]
${premiumSubscriptionInformationBtniOS}    xpath=//XCUIElementTypeStaticText[@name="Premium subscription information"]
${yourCaliforniaPrivacyRightsBtniOS}       xpath=//XCUIElementTypeStaticText[@name="Your California privacy rights"]
${doNotSellMyPersonalInformationBtniOS}    xpath=//XCUIElementTypeStaticText[@name="Do not sell my personal information"]
${logoutBtniOS}                            xpath=//XCUIElementTypeButton[@name="Logout"]
${subscribeToPremiumBtniOS}                xpath=//XCUIElementTypeButton[@name="Subscribe to Premium"]
${closeWebViewBtniOS}                      xpath=//XCUIElementTypeButton[@name="exitViewButton"]
${privacyBodyTxtiOS}                       xpath=//XCUIElementTypeButton[@name="Refresh"]
${termsOfServiceBodyTxtiOS}                xpath=//XCUIElementTypeStaticText[@name="TERMS OF SERVICE"]
${premiumSubscriptionBodyTxtiOS}           xpath=//XCUIElementTypeStaticText[@name="Premium Subscription Information"]
${californiaPrivacyRightsBodyTxtiOS}       xpath=//XCUIElementTypeStaticText[@name="IMPORTANT PRIVACY NOTICE FOR CALIFORNIA CONSUMERS"]
${doNotSellMyInformationBodyTxtiOS}        xpath=//XCUIElementTypeStaticText[@name="Trifecta Nutrition, Inc.’s CCPA"]

#ACCOUNT
${backBtnAccountiOS}      xpath=//XCUIElementTypeButton[@name="ic back dark"]
${logOutAccountBtniOS}    xpath=//XCUIElementTypeButton[@name="Log Out"]
${cameraBtniOS}           xpath=//XCUIElementTypeButton[@name="ic camera"]
${accountTxtiOS}          xpath=//XCUIElementTypeStaticText[@name="Account"]
${nameTxtiOS}             xpath=//XCUIElementTypeStaticText[@name="Name"]
${emailTxtiOS}            xpath=//XCUIElementTypeStaticText[@name="Email"]
${genderTxtiOS}           xpath=//XCUIElementTypeStaticText[@name="Gender"]
${birthDateTxtiOS}        xpath=//XCUIElementTypeStaticText[@name="Birth date"]
${weightTxtiOS}           xpath=//XCUIElementTypeStaticText[@name="Weight"]
${heightTxtiOS}           xpath=//XCUIElementTypeStaticText[@name="Height"]
${ketoDietTxtiOS}         xpath=//XCUIElementTypeStaticText[@name="Keto diet"]
${nutritionGoalTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Nutrition goal"]
${activityLevelTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Activity level"]
${resetPasswordBtniOS}    xpath=//XCUIElementTypeStaticText[@name="Reset password"]
${okLinkSentBtniOS}       xpath=//XCUIElementTypeStaticText[@name="OK"]
${nameFieldAccountiOS}    xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                       /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                       /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                       /XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField

*** Keywords ***

#Two keywords below look identical but I would like to keep them separately
Open User Account iOS
    Wait Until Visible And Click Element Apps    ${mainMenuBtniOS}
    Wait Until Visible And Click Element Apps    ${accountBtniOS}

Close User Account iOS
    Wait Until Visible And Click Element Apps    ${backBtnAccountiOS}
    Wait Until Visible And Click Element Apps    ${closeMainMenuBtniOS}

Log Out iOS
    Open User Account iOS
    Wait Until Visible And Click Element Apps    ${logOutAccountBtniOS}

Review Main Menu UI iOS
    Wait Until Visible And Click Element Apps    ${mainMenuBtniOS}
    @{list}=    Create List                      ${accountBtniOS}
    ...                                          ${myFeedsBtniOS}
    ...                                          ${savedBtniOS}
    ...                                          ${helpBtniOS}
    ...                                          ${fitnessTimersBtniOS}
    ...                                          ${workoutLogBtniOS}
    ...                                          ${movementLogBtniOS}
    FOR                                          ${item}    IN    @{list}
        Element Should Be Visible                ${item}
    END
    Scroll Down                                  ${logoutBtniOS}
    @{list}=    Create List                      ${privacyPolicyBtniOS}
    ...                                          ${termsOfServiceBtniOS}
    ...                                          ${premiumSubscriptionInformationBtniOS}
    ...                                          ${yourCaliforniaPrivacyRightsBtniOS}
    ...                                          ${doNotSellMyPersonalInformationBtniOS}
    ...                                          ${logoutBtniOS}
    ...                                          ${subscribeToPremiumBtniOS}
    FOR                                          ${item}    IN    @{list}
        Element Should Be Visible                ${item}
    END
    Wait Until Visible And Click Element Apps    ${closeMainMenuBtniOS}

Review User Account UI iOS
    Open User Account iOS
    @{list}=    Create List                      ${cameraBtniOS}
    ...                                          ${accountTxtiOS}
    ...                                          ${nameTxtiOS}
    ...                                          ${emailTxtiOS}
    ...                                          ${genderTxtiOS}
    ...                                          ${birthDateTxtiOS}
    ...                                          ${weightTxtiOS}
    ...                                          ${heightTxtiOS}
    ...                                          ${ketoDietTxtiOS}
    ...                                          ${nutritionGoalTxtiOS}
    ...                                          ${activityLevelTxtiOS}
    FOR                                          ${item}    IN    @{list}
        Element Should Be Visible                ${item}
    END
    Click Element                                ${backBtnAccountiOS}
    Wait Until Visible And Click Element Apps    ${closeMainMenuBtniOS}

Reset User Password iOS
    Open User Account iOS
    Scroll Down                                  ${resetPasswordBtniOS}
    Click Element                                ${resetPasswordBtniOS}
    Wait Until Visible And Click Element Apps    ${okLinkSentBtniOS}
    Close User Account iOS

Update User Name iOS
    [Arguments]                      ${userName}
    Open User Account iOS
    Wait Until Element Is Visible    ${nameFieldAccountiOS}
    Clear Text                       ${nameFieldAccountiOS}
    Input Text                       ${nameFieldAccountiOS}    ${userName}
    Close User Account iOS
    Open User Account iOS
    Wait Until Element Is Visible    ${nameFieldAccountiOS}
    Element Should Contain Text      ${nameFieldAccountiOS}    ${userName}
    Close User Account iOS

Review Info WebView iOS
    [Arguments]                                  ${infoElementBtniOS}    ${infoElementBodyTxtiOS}
    Wait Until Visible And Click Element Apps    ${mainMenuBtniOS}
    Scroll Down                                  ${infoElementBtniOS}
    Click Element                                ${infoElementBtniOS}
    Wait Until Element Is Visible                ${infoElementBodyTxtiOS}
    Click Element                                ${closeWebViewBtniOS}
