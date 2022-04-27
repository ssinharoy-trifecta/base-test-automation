*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#INTRO SCREEN
${getStartedBtnIntroAndroid}    id=com.n_ix.pocket_wod:id/getStartedButton
${trifectaLogoIntroAndroid}     id=com.n_ix.pocket_wod:id/trifecta_icon
${trifectaVideoIntroAndroid}    id=com.n_ix.pocket_wod:id/backgroundVideoView

#WELCOME TO TRIFECTA SCREEN
${athleteImgOnboardingAndroid}              id=com.n_ix.pocket_wod:id/athleteLogo
${welcomeToTrifectaTxtOnboardingAndroid}    id=com.n_ix.pocket_wod:id/subtitleView
${letsDoItBtnOnboardingAndroid}             id=com.n_ix.pocket_wod:id/letsDoItBtn

#GENDER SCREEN
${backBtnOnboardingAndroid}                id=com.n_ix.pocket_wod:id/backBtn
${selectYourGenderTxtOnboardingAndroid}    id=com.n_ix.pocket_wod:id/selectGenderView
${maleBtnOnboardingAndroid}                id=com.n_ix.pocket_wod:id/maleBtn
${femaleBtnOnboardingAndroid}              id=com.n_ix.pocket_wod:id/femaleBtn
${otherBtnOnboardingAndroid}               id=com.n_ix.pocket_wod:id/otherBtn

#NUTRITION GOAL SCREEN
${whatsYourNutritionGoalTxtOnboardingAndroid}     id=com.n_ix.pocket_wod:id/titleView
${loseWeightBtnOnboardingAndroid}                 id=com.n_ix.pocket_wod:id/loseBtn
${maintainWeightBtnOnboardingAndroid}             id=com.n_ix.pocket_wod:id/maintainBtn
${gainMuscletBtnOnboardingAndroid}                id=com.n_ix.pocket_wod:id/gainBtn

#ACTIVITY LEVEL SCREEN
${whatsYourActivityLevelTxtOnboardingAndroid}    id=com.n_ix.pocket_wod:id/titleView
${sedentaryBtnOnboardingAndroid}                 id=com.n_ix.pocket_wod:id/sedentaryBtn
${lightlyActiveBtnOnboardingAndroid}             id=com.n_ix.pocket_wod:id/lightlyBtn
${moderatelyActiveBtnOnboardingAndroid}          id=com.n_ix.pocket_wod:id/moderatelyBtn
${veryActiveBtnOnboardingAndroid}                id=com.n_ix.pocket_wod:id/activeBtn
${extraActiveBtnOnboardingAndroid}               id=com.n_ix.pocket_wod:id/extraBtn

#KETO SCREEN
${areYouFollowingAKetoDietTxtOnboardingAndroid}    id=com.n_ix.pocket_wod:id/ketoTitleView
${yesKetoBtnOnboardingAndroid}                     id=com.n_ix.pocket_wod:id/yesBtn
${noKetoBtnOnboardingAndroid}                      id=com.n_ix.pocket_wod:id/noBtn

#BIO SCREEN
${almostThereTxtOnboardingAndroid}    id=com.n_ix.pocket_wod:id/selectGenderView
${weightOnboardingAndroid}            id=com.n_ix.pocket_wod:id/weight_text_view
${valueInputOnboardingAndroid}        id=com.n_ix.pocket_wod:id/first_value_edit_text
${setValueBtnOnboardingAndroid}       id=com.n_ix.pocket_wod:id/set_button 
${heightOnboardingAndroid}            id=com.n_ix.pocket_wod:id/height_text_view
${birthdayOnboardingAndroid}          id=com.n_ix.pocket_wod:id/birthday_text_view
${okBirthdayBtnOnboardingAndroid}     id=android:id/button1
${doneOnboardingBtnAndroid}           id=com.n_ix.pocket_wod:id/doneBtn

#TERMS OF USE
${termsOfUseCancelBtnAndroid}    id=com.n_ix.pocket_wod:id/cancelButton
${termsOfUseAgreeBtnAndroid}     id=com.n_ix.pocket_wod:id/agreeButton

*** Keywords ***

Validate Intro Screen Details Android
    @{list}=    Create List    ${getStartedBtnIntroAndroid}  
    ...                        ${trifectaLogoIntroAndroid}
    ...                        ${trifectaVideoIntroAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
    END

Complete User Onboarding Android
    @{list}=    Create List    ${letsDoItBtnOnboardingAndroid} 
    ...                        ${maleBtnOnboardingAndroid}
    ...                        ${loseWeightBtnOnboardingAndroid}
    ...                        ${moderatelyActiveBtnOnboardingAndroid}
    ...                        ${noKetoBtnOnboardingAndroid}
    ...                        ${weightOnboardingAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element     ${item}
    END
    Wait Until Element Is Visible    ${valueInputOnboardingAndroid}   timeout=10
    Input Value                      ${valueInputOnboardingAndroid}   200
    Wait Until Element Is Visible    ${setValueBtnOnboardingAndroid}   timeout=10
    Click Element                    ${setValueBtnOnboardingAndroid}
    Wait Until Element Is Visible    ${heightOnboardingAndroid}   timeout=10
    Click Element                    ${heightOnboardingAndroid}
    Wait Until Element Is Visible    ${valueInputOnboardingAndroid}   timeout=10
    Input Value                      ${valueInputOnboardingAndroid}   6
    @{list}=    Create List    ${setValueBtnOnboardingAndroid}
    ...                        ${birthdayOnboardingAndroid}
    ...                        ${okBirthdayBtnOnboardingAndroid}
    ...                        ${doneOnboardingBtnAndroid}
    FOR     ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element     ${item}
    END

Agree To Terms Of Use Android
    Wait Until Element Is Visible    ${termsOfUseAgreeBtnAndroid}    timeout=30
    Click Element                    ${termsOfUseAgreeBtnAndroid}
