*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#INTRO SREEN
${getStartedBtnIntroiOS}       xpath=//XCUIElementTypeButton[@name="Get Started"]
${trifectaLogoIntroiOS}        id=trifecta_logo_horizontal_white
${trifectaVideoIntroiOS}       xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther

#WELCOME TO TRIFECTA SCREEN
${athleteImgOnboardingiOS}              xpath=//XCUIElementTypeImage[@name="img_onboarding"]
${welcomeToTrifectaTxtOnboardingiOS}    xpath=//XCUIElementTypeStaticText[@name="Welcome to Trifecta!"]
${letsDoItBtnOnboardingiOS}             xpath=//XCUIElementTypeButton[@name="Let’s do it!"]

#GENDER SCREEN
${backBtnOnboardingiOS}                xpath=//XCUIElementTypeButton[@name="ic onboarding back"]
${selectYourGenderOnboardingTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Select your gender:"]
${maleBtnOnboardingiOS}                xpath=//XCUIElementTypeButton[@name="Male"]
${femaleBtnOnboardingiOS}              xpath=//XCUIElementTypeButton[@name="Female"]
${otherBtnOnboardingiOS}               xpath=//XCUIElementTypeButton[@name="Other"]

#NUTRITION GOAL SCREEN
${whatsYourNutritionGoalTxtOnboardingiOS}    id=What’s your nutrition goal?
${loseWeightBtnOnboardingiOS}                id=Lose Weight\n\nI want to get leaner and tone
${maintainWeightBtnOnboardingiOS}            id=Maintain Weight\n\nI want to stay in my best shape
${gainMuscletBtnOnboardingiOS}               id=Gain Muscle\n\nI want to build muscle strength

#ACTIVITY LEVEL SCREEN
${whatsYourActivityLevelTxtOnboardingiOS}    id=What’s your activity level?
${sedentaryBtnOnboardingiOS}                 id=Sedentary\n\nLittle or no exercise, work at a desk job
${lightlyActiveBtnOnboardingiOS}             id=Lightly Active\n\nLight exercise or sports 1-3 days / week
${moderatelyActiveBtnOnboardingiOS}          id=Moderately Active\n\nModerate exercise or sports 3-5 days / week
${veryActiveBtnOnboardingiOS}                id=Very Active\n\nHigh intensity training 6-7 times / week
${extraActiveBtnOnboardingiOS}               id=Extra Active\n\nHard training x2 / day or / and physical labor

#KETO SCREEN
${areYouFollowingAKetoDietTxtOnboardingiOS}    xpath=//XCUIElementTypeStaticText[@name="Are you following a keto diet?"]
${yesKetoBtnOnboardingiOS}                     xpath=//XCUIElementTypeButton[@name="Yes"]
${noKetoBtnOnboardingiOS}                      xpath=//XCUIElementTypeButton[@name="No"]

#BIO SCREEN
${almostThereTxtOnboardingiOS}              xpath=//XCUIElementTypeStaticText[@name="Almost there!"]
${weightOnboardingPickerOnboardingiOS}      chain=**/XCUIElementTypeTextField[`value == "0"`]
${heightOnboardingPickerOnboardingiOS}      chain=**/XCUIElementTypeTextField[`value == "0 ft 0 in"`]
${heightOnboardingPickerCmOnboardingiOS}    chain=**/XCUIElementTypeTextField[`value == "0 cm"`]
${birthdayOnboardingPickerOnboardingiOS}    chain=**/XCUIElementTypeTextField[`value == "Dec 31, 1969"`]
${doneBtnOnboardingiOS}                     xpath=//XCUIElementTypeButton[@name="Done"]

#NOTIFICATIONS
${allowNotificationsBtniOS}      xpath=//XCUIElementTypeButton[@name="Allow Notifications"]
${noTanksNotificationsBtniOS}    xpath=//XCUIElementTypeStaticText[@name="No thanks"]

#TERMS OF USE
${termsOfUseCancelBtniOS}    xpath=//XCUIElementTypeStaticText[@name="Cancel"]
${termsOfUseAgreeBtniOS}     xpath=//XCUIElementTypeStaticText[@name="Agree"]

#iOS NATIVE OBJECTS
${allowBtniOS}    xpath=//XCUIElementTypeButton[@name="Allow"]

*** Keywords ***

Check Data Alert iOS
    Sleep             3
    ${alertiOS}       Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=3
    Run Keyword If    '${alertiOS}' == 'False'    Click Element    ${allowBtniOS}

Validate Intro Screen Details iOS
    Wait Until Element Is Visible    ${getStartedBtnIntroiOS}    timeout=30 
    Wait Until Element Is Visible    ${trifectaLogoIntroiOS}    timeout=30
    Wait Until Element Is Visible    ${trifectaVideoIntroiOS}    timeout=30

Complete User Onboarding iOS
    Wait Until Element Is Visible    ${letsDoItBtnOnboardingiOS}  timeout=30
    Click Element                    ${letsDoItBtnOnboardingiOS}
    Wait Until Element Is Visible    ${maleBtnOnboardingiOS}  timeout=10
    Click Element                    ${maleBtnOnboardingiOS}
    Wait Until Element Is Visible    ${loseWeightBtnOnboardingiOS}    timeout=10
    Click Element                    ${loseWeightBtnOnboardingiOS}
    Wait Until Element Is Visible    ${moderatelyActiveBtnOnboardingiOS}  timeout=10
    Click Element                    ${moderatelyActiveBtnOnboardingiOS}
    Wait Until Element Is Visible    ${noKetoBtnOnboardingiOS}    timeout=10
    Click Element                    ${noKetoBtnOnboardingiOS}
    Wait Until Element Is Visible    ${weightOnboardingPickerOnboardingiOS}   timeout=10
    Input Value                      ${weightOnboardingPickerOnboardingiOS}   200
    Wait Until Element Is Visible    ${heightOnboardingPickerOnboardingiOS}   timeout=10
    Click Element                    ${heightOnboardingPickerOnboardingiOS}
    Click Text                       cm    exact_match=True
    Wait Until Element Is Visible    ${heightOnboardingPickerCmOnboardingiOS}    timeout=10
    Input Value                      ${heightOnboardingPickerCmOnboardingiOS}    180
    Click Text                       Done    exact_match=True
    Wait Until Element Is Visible    ${birthdayOnboardingPickerOnboardingiOS}    timeout=10
    Click Element                    ${birthdayOnboardingPickerOnboardingiOS}
    Sleep                            1
    Click Text                       Done   exact_match=True
    Sleep                            1
    Wait Until Element Is Visible    ${doneBtnOnboardingiOS}    timeout=10
    Click Element                    ${doneBtnOnboardingiOS}
    Check Notifications Alert iOS
    Wait Until Element Is Visible    ${allowNotificationsBtniOS}    timeout=30
    Click Element                    ${allowNotificationsBtniOS}
    Check Notifications Alert iOS

Check Notifications Alert iOS
    Sleep             3
    ${alert2iOS}      Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtniOS}    timeout=3
    Run Keyword If    '${alert2iOS}' == 'False'    Click Element    ${allowBtniOS}

Agree To Terms Of Use iOS
    Wait Until Element Is Visible    ${termsOfUseAgreeBtniOS}    timeout=30
    Click Element                    ${termsOfUseAgreeBtniOS}



