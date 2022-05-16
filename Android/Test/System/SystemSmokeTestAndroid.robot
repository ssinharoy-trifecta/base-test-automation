*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/Feature/AccountMgmtResourcesAndroid.robot
Resource   ../../Resources/Feature/AuthenticationResourcesAndroid.robot
Resource   ../../Resources/Feature/NutritionResourcesAndroid.robot
Resource   ../../Resources/Feature/OnboardingResourcesAndroid.robot
Resource   ../../Resources/Feature/ShopWooResourcesAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

# TODO: COULD POTENTIALLY COMBINE KEYWORDS INTO ONE
Suite Setup       Browserstack.Upload Android Application To Browserstack
Suite Teardown    Run Keywords    AccountMgmtResourcesAndroid.Log Out Android
...                               Browserstack.Mark App Automate Session Status Browserstack

*** Test Cases ***

Launch Application
    #Launch Android Application On Emulator
    Browserstack.Launch Android Application On Browserstack Device  ${configBS}

Intro Screen UI Review
    OnboardingResourcesAndroid.Validate Intro Screen Details Android

Sign Up - New User
    AuthenticationResourcesAndroid.Sign Up As New User Android

Complete User Onboarding
    OnboardingResourcesAndroid.Complete User Onboarding Android

Terms Of Use - Agree
    OnboardingResourcesAndroid.Agree To Terms Of Use Android

Add Weight To The Weight Card
    NutritionResourcesAndroid.Add Weight To The Weight Card Android    200

Add Water To The Water Card
    NutritionResourcesAndroid.Add Water To The Water Card Android

Log Food To Snacks
    NutritionResourcesAndroid.Log Food Android    ${snacksBtnAndroid}    Apple

Log Food To Dinner
    NutritionResourcesAndroid.Log Food Android    ${dinnerBtnAndroid}    Pasta

Log Food To Lunch
    NutritionResourcesAndroid.Log Food Android    ${lunchBtnAndroid}    Pizza

Log Food To Breakfast
    NutritionResourcesAndroid.Log Food Android    ${breakfastBtnAndroid}    Avocado

Add Custom Food
    NutritionResourcesAndroid.Add Custom Food Android    Test Food Item    Test Brand    1    100

Log Out From My Account
    AccountMgmtResourcesAndroid.Log Out Android

Sign In - Existing User
    AuthenticationResourcesAndroid.Sign In As Existing User Android

# Shop Dashboard UI And Details
#     ShopWooResourcesAndroid.Open Shop Android
#     ShopWooResourcesAndroid.Validadate Dashboard UI And Details Android
#     ShopWooResourcesAndroid.Close Shop Android

