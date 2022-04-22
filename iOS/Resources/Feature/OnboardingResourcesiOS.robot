*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

*** Variables ***

#WELCOME TO TRIFECTA SCREEN
${onboardingImgiOS}           xpath=//XCUIElementTypeImage[@name="img_onboarding"]
${welcomeToTrifectaTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Welcome to Trifecta!"]
${letsDoItBtniOS}             xpath=//XCUIElementTypeButton[@name="Let’s do it!"]

#GENDER SCREEN
${backBtnOnboardingiOS}      xpath=//XCUIElementTypeButton[@name="ic onboarding back"]
${selectYourGenderTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Select your gender:"]
${maleBtniOS}                xpath=//XCUIElementTypeButton[@name="Male"]
${femaleBtniOS}              xpath=//XCUIElementTypeButton[@name="Female"]
${otherBtniOS}               xpath=//XCUIElementTypeButton[@name="Other"]

#NUTRITION GOAL SCREEN
${whatsYourNutritionGoalTxtiOS}    id=What’s your nutrition goal?
${loseWeightBtniOS}                id=Lose Weight\n\nI want to get leaner and tone
${maintainWeightBtniOS}            id=Maintain Weight\n\nI want to stay in my best shape
${gainMuscletBtniOS}               id=Gain Muscle\n\nI want to build muscle strength

#ACTIVITY LEVEL SCREEN
${whatsYourActivityLevelTxtiOS}    id=What’s your activity level?
${sedentaryBtniOS}                 id=Sedentary\n\nLittle or no exercise, work at a desk job
${lightlyActiveBtniOS}             id=Lightly Active\n\nLight exercise or sports 1-3 days / week
${moderatelyActiveBtniOS}          id=Moderately Active\n\nModerate exercise or sports 3-5 days / week
${veryActiveBtniOS}                id=Very Active\n\nHigh intensity training 6-7 times / week
${extraActiveBtniOS}               id=Extra Active\n\nHard training x2 / day or / and physical labor

#KETO SCREEN
${areYouFollowingAKetoDietTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Are you following a keto diet?"]
${yesKetoBtniOS}                     xpath=//XCUIElementTypeButton[@name="Yes"]
${noKetoBtniOS}                      xpath=//XCUIElementTypeButton[@name="No"]

#BIO SCREEN
${almostThereTxtiOS}              xpath=//XCUIElementTypeStaticText[@name="Almost there!"]
${weightOnboardingPickeriOS}      chain=**/XCUIElementTypeTextField[`value == "0"`]
${heightOnboardingPickeriOS}      chain=**/XCUIElementTypeTextField[`value == "0 ft 0 in"`]
${heightOnboardingPickerCmiOS}    chain=**/XCUIElementTypeTextField[`value == "0 cm"`]
${birthdayOnboardingPickeriOS}    chain=**/XCUIElementTypeTextField[`value == "Dec 31, 1969"`]
${doneOnboardingBtniOS}           xpath=//XCUIElementTypeButton[@name="Done"]

#NOTIFICATIONS
${allowNotificationsBtniOS}    xpath=//XCUIElementTypeButton[@name="Allow Notifications"]
${noTanksNotificationsBtniOS}  xpath=//XCUIElementTypeStaticText[@name="No thanks"]

#TERMS OF USE
${termsOfUseCancelBtniOS}    xpath=//XCUIElementTypeStaticText[@name="Cancel"]
${termsOfUseAgreeBtniOS}     xpath=//XCUIElementTypeStaticText[@name="Agree"]

*** Keywords ***

Complete User Onboarding iOS
    Wait Until Element Is Visible    ${letsDoItBtniOS}  timeout=30
    Click Element                    ${letsDoItBtniOS}
    Wait Until Element Is Visible    ${maleBtniOS}  timeout=10
    Click Element                    ${maleBtniOS}
    Wait Until Element Is Visible    ${loseWeightBtniOS}    timeout=10
    Click Element                    ${loseWeightBtniOS}
    Wait Until Element Is Visible    ${moderatelyActiveBtniOS}  timeout=10
    Click Element                    ${moderatelyActiveBtniOS}
    Wait Until Element Is Visible    ${noKetoBtniOS}    timeout=10
    Click Element                    ${noKetoBtniOS}
    Wait Until Element Is Visible    ${weightOnboardingPickeriOS}   timeout=10
    Input Value                      ${weightOnboardingPickeriOS}   200
    Wait Until Element Is Visible    ${heightOnboardingPickeriOS}   timeout=10
    Click Element                    ${heightOnboardingPickeriOS}
    Click Text                       cm    exact_match=True
    Wait Until Element Is Visible    ${heightOnboardingPickerCmiOS}    timeout=10
    Input Value                      ${heightOnboardingPickerCmiOS}    180
    Click Text                       Done    exact_match=True
    Wait Until Element Is Visible    ${birthdayOnboardingPickeriOS}    timeout=10
    Click Element                    ${birthdayOnboardingPickeriOS}
    Sleep                            1
    Click Text                       Done   exact_match=True
    Sleep                            1
    Wait Until Element Is Visible    ${doneOnboardingBtniOS}    timeout=10
    Click Element                    ${doneOnboardingBtniOS}

Agree To Terms Of Use
    Check Notifications Alert iOS
    Wait Until Element Is Visible    ${allowNotificationsBtniOS}    timeout=10
    Click Element                    ${allowNotificationsBtniOS}
    Check Notifications Alert iOS
    Wait Until Element Is Visible    ${termsOfUseAgreeBtniOS}    timeout=10
    Click Element                    ${termsOfUseAgreeBtniOS}






