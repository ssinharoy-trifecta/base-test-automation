*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

Resource   ../../Resources/Feature/AccountMgmtResourcesAndroid.robot
Resource   ../../Resources/Feature/AuthenticationResourcesAndroid.robot
Resource   ../../Resources/Feature/FitnessResourcesAndroid.robot
Resource   ../../Resources/Feature/NutritionResourcesAndroid.robot
Resource   ../../Resources/Feature/OnboardingResourcesAndroid.robot
Resource   ../../Resources/Feature/ShopWooResourcesAndroid.robot
Resource   ../../Resources/System/EmulatorLauncherAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

# TODO: COULD POTENTIALLY COMBINE KEYWORDS INTO ONE
Suite Setup       Upload Android Application To Browserstack
Suite Teardown    Run Keywords    Log Out Android
...                               Mark App Automate Session Status Browserstack

*** Test Cases ***

Launch Application
    Launch Android Application On Browserstack Device

Intro Screen UI Review
    Validate Intro Screen Details Android

Sign Up - New User
    Sign Up As New User Android

Complete User Onboarding
    Complete User Onboarding Android

Terms Of Use - Agree
    Agree To Terms Of Use Android

Add Weight To The Weight Card
    Add Weight To The Weight Card Android    200

Add Water To The Water Card
    Add Water To The Water Card Android

Log Food To Snacks
    Log Food Android    ${snacksBtnAndroid}    Apple

Log Food To Dinner
    Log Food Android    ${dinnerBtnAndroid}    Pasta

Log Food To Lunch
    Log Food Android    ${lunchBtnAndroid}    Pizza

Log Food To Breakfast
    Log Food Android    ${breakfastBtnAndroid}    Avocado

Add Custom Food
    Add Custom Food Android    Test Food Item    Test Brand    1    100

Log Out From My Account
    Log Out Android

Sign In - Existing User
    Sign In As Existing User Android

# Shop Dashboard UI And Details
#     Open Shop Android
#     Validadate Dashboard UI And Details Android
#     Close Shop Android
#     Log Out Android
