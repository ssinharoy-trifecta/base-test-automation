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
${privacyBodyTxtiOS}                       xpath=//XCUIElementTypeOther[@name="Vertical scroll bar, 33 pages"]
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

Open Main Menu iOS
    Wait Until Element Is Visible    ${mainMenuBtniOS}    timeout=10
    Click Element                    ${mainMenuBtniOS}

Close Main Menu iOS
    Wait Until Element Is Visible    ${closeMainMenuBtniOS}    timeout=10
    Click Element                    ${closeMainMenuBtniOS}

Open User Account iOS
    Wait Until Element Is Visible    ${accountBtniOS}    timeout=10
    Click Element                    ${accountBtniOS}

Close User Account iOS
    Wait Until Element Is Visible    ${backBtnAccountiOS}
    Click Element                    ${backBtnAccountiOS}

Log Out iOS
    Open Main Menu iOS
    Open User Account iOS
    Wait Until Element Is Visible    ${logOutAccountBtniOS}    timeout=10
    Click Element                    ${logOutAccountBtniOS}

Review Main Menu UI iOS
    Open Main Menu iOS
    @{list}=    Create List    ${accountBtniOS}
    ...                        ${myFeedsBtniOS}
    ...                        ${savedBtniOS}
    ...                        ${helpBtniOS}
    ...                        ${fitnessTimersBtniOS}
    ...                        ${workoutLogBtniOS}
    ...                        ${movementLogBtniOS}
    FOR    ${item}    IN    @{list}
        Element Should Be Visible   ${item}    timeout=10
    END
    Scroll Down                   ${logoutBtniOS}
    @{list}=    Create List       ${privacyPolicyBtniOS}
    ...                           ${termsOfServiceBtniOS}
    ...                           ${premiumSubscriptionInformationBtniOS}
    ...                           ${yourCaliforniaPrivacyRightsBtniOS}
    ...                           ${doNotSellMyPersonalInformationBtniOS}
    ...                           ${logoutBtniOS}
    ...                           ${subscribeToPremiumBtniOS}
    FOR    ${item}    IN    @{list}
        Element Should Be Visible   ${item}    timeout=10
    END
    Close Main Menu iOS

Review User Account UI iOS
    Open Main Menu iOS
    Open User Account iOS
    @{list}=    Create List    ${cameraBtniOS}
    ...                        ${accountTxtiOS}
    ...                        ${nameTxtiOS}
    ...                        ${emailTxtiOS}
    ...                        ${genderTxtiOS}
    ...                        ${birthDateTxtiOS}
    ...                        ${weightTxtiOS}
    ...                        ${heightTxtiOS}
    ...                        ${ketoDietTxtiOS}
    ...                        ${nutritionGoalTxtiOS}
    ...                        ${activityLevelTxtiOS}
    FOR    ${item}    IN    @{list}
        Element Should Be Visible   ${item}    timeout=10
    END
    Click Element    ${backBtnAccountiOS}
    Close Main Menu iOS

Reset User Password iOS
    Open Main Menu iOS
    Open User Account iOS
    Scroll Down                      ${resetPasswordBtniOS}
    Click Element                    ${resetPasswordBtniOS}
    Wait Until Element Is Visible    ${okLinkSentBtniOS}
    Click Element                    ${okLinkSentBtniOS}
    Close User Account iOS
    Close Main Menu iOS

Update User Name iOS
    [Arguments]                      ${userName}
    Open Main Menu iOS
    Open User Account iOS
    Wait Until Element Is Visible    ${nameFieldAccountiOS}
    Clear Text                       ${nameFieldAccountiOS}
    Input Text                       ${nameFieldAccountiOS}    ${userName}
    Close User Account iOS
    Close Main Menu iOS
    Open Main Menu iOS
    Open User Account iOS
    Wait Until Element Is Visible     ${nameFieldAccountiOS}
    Element Should Contain Text       ${nameFieldAccountiOS}    ${userName}
    Close User Account iOS
    Close Main Menu iOS

Review Privacy Policy iOS
    Open Main Menu iOS
    Scroll Down                      ${privacyPolicyBtniOS}
    Click Element                    ${privacyPolicyBtniOS}
    Wait Until Element Is Visible    ${privacyBodyTxtiOS}     timeout=10
    Click Element                    ${closeWebViewBtniOS}

Review Terms Of Service iOS
    Open Main Menu iOS
    Scroll Down                      ${termsOfServiceBtniOS}
    Click Element                    ${termsOfServiceBtniOS}
    Wait Until Element Is Visible    ${termsOfServiceBodyTxtiOS}    timeout=10
    Click Element                    ${closeWebViewBtniOS}

Review Premium Subscription Information iOS
    Open Main Menu iOS
    Scroll Down                      ${premiumSubscriptionInformationBtniOS} 
    Click Element                    ${premiumSubscriptionInformationBtniOS} 
    Wait Until Element Is Visible    ${premiumSubscriptionBodyTxtiOS}     timeout=10
    Click Element                    ${closeWebViewBtniOS}

Review Your California Privacy Rights iOS
    Open Main Menu iOS
    Scroll Down                      ${yourCaliforniaPrivacyRightsBtniOS} 
    Click Element                    ${yourCaliforniaPrivacyRightsBtniOS} 
    Wait Until Element Is Visible    ${californiaPrivacyRightsBodyTxtiOS}     timeout=10
    Click Element                    ${closeWebViewBtniOS}

Review Do Not Sell My Information iOS
    Open Main Menu iOS
    Scroll Down                      ${doNotSellMyPersonalInformationBtniOS}
    Click Element                    ${doNotSellMyPersonalInformationBtniOS}
    Wait Until Element Is Visible    ${doNotSellMyInformationBodyTxtiOS}     timeout=10
    Click Element                    ${closeWebViewBtniOS}
