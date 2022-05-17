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

#ACCOUNT
${backBtnAccountiOS}    xpath=//XCUIElementTypeButton[@name="ic back dark"]
${logOutAccountBtniOS}    xpath=//XCUIElementTypeButton[@name="Log Out"]
${cameraBtniOS}    xpath=//XCUIElementTypeButton[@name="ic camera"]
${accountTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Account"]
${nameTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Name"]
${emailTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Email"]
${genderTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Gender"]
${birthDateTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Birth date"]
${weightTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Weight"]
${heightTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Height"]
${ketoDietTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Keto diet"]
${nutritionGoalTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Nutrition goal"]
${activityLevelTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Activity level"]


${logoutBtniOS}      xpath=//XCUIElementTypeButton[@name="Logout"]
${subscribeToPremiumBtniOS}      xpath=//XCUIElementTypeButton[@name="Subscribe to Premium"]

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
    Scroll Down                      ${logoutBtniOS}
       @{list}=    Create List    ${privacyPolicyBtniOS}
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
