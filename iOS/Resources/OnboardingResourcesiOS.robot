*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

*** Variables ***

${onboardingImgiOS}           xpath=//XCUIElementTypeImage[@name="img_onboarding"]
${welcomeToTrifectaTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Welcome to Trifecta!"]
${letsDoItBtniOS}             xpath=//XCUIElementTypeButton[@name="Let’s do it!"]

${backBtnOnboardingiOS}      xpath=//XCUIElementTypeButton[@name="ic onboarding back"]
${selectYourGenderTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Select your gender:"]
${maleBtniOS}                xpath=//XCUIElementTypeButton[@name="Male"]
${femaleBtniOS}              xpath=//XCUIElementTypeButton[@name="Female"]
${otherBtniOS}               xpath=//XCUIElementTypeButton[@name="Other"]

${whatsYourNutritionGoalTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="What’s your nutrition goal?"]
${loseWeightBtniOS}                xpath=//XCUIElementTypeButton[@name="Lose Weight I want to get leaner and tone"]
${gainMuscleBtniOS}                xpath//XCUIElementTypeButton[@name="Gain Muscle I want to build muscle strength"]

${whatsYourActivityLevelTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="What’s your activity level?"]
${sedentaryBtniOS}                 xpath=//XCUIElementTypeButton[@name="Sedentary Little or no exercise, work at a desk job"]
${lightlyActiveBtniOS}             xpath=//XCUIElementTypeButton[@name="Lightly Active Light exercise or sports 1-3 days / week"]
${moderatelyActiveBtniOS}          xpath=//XCUIElementTypeButton[@name="Moderately Active Moderate exercise or sports 3-5 days / week"]
${veryActiveBtniOS}                xpath=//XCUIElementTypeButton[@name="Very Active High intensity training 6-7 times / week"]
${extraActiveBtniOS}               xpath=//XCUIElementTypeButton[@name="Extra Active Hard training x2 / day or / and physical labor"]

${areYouFollowingAKetoDietTxtiOS}    xpath=//XCUIElementTypeStaticText[@name="Are you following a keto diet?"]
${yesKetoBtniOS}                     xpath=//XCUIElementTypeButton[@name="Yes"]
${noKetoBtniOS}                      xpath=//XCUIElementTypeButton[@name="No"]

${almostThereTxtiOS}              xpath=//XCUIElementTypeStaticText[@name="Almost there!"]
${weightOnboardingPickeriOS}      xpath=//XCUIElementTypeApplication[@name=\"TriDebug\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther"
${heighOnboardingPickeriOS}       xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther
${birthdayOnboardingPickeriOS}    xpath=//XCUIElementTypeApplication[@name=\"TriDebug\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[3]/XCUIElementTypeOther
${doneOnboardingBtniOS}           xpath=//XCUIElementTypeButton[@name="Done"]

*** Keywords ***

Complete User Onboarding iOS
    Wait Until Element Is Visible    ${letsDoItBtniOS}    timeout=10
    Click Element                    ${letsDoItBtniOS}
    Wait Until Element Is Visible    ${maleBtniOS}    timeout=10
    Click Element                    ${maleBtniOS}
    Wait Until Element Is Visible    ${loseWeightBtniOS}
    Click Element                    ${loseWeightBtniOS}
    Wait Until Element Is Visible    ${moderatelyActiveBtniOS}    timeout=10
    Click Element                    ${moderatelyActiveBtniOS}
    Wait Until Element Is Visible    ${noKetoBtniOS}    timeout=10
    Click Element                    ${noKetoBtniOS}
