*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/Feature/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/Feature/AuthenticationResourcesiOS.robot
Resource   ../../Resources/Feature/NutritionResourcesiOS.robot
Resource   ../../Resources/Feature/OnboardingResourcesiOS.robot
Resource   ../../Resources/Feature/ShopWooResourcesiOS.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

# TODO: COULD POTENTIALLY COMBINE KEYWORDS INTO ONE
Suite Setup       Browserstack.Upload iOS Application To Browserstack
Suite Teardown    Run Keywords    AccountMgmtResourcesiOS.Log Out iOS
...                               Browserstack.Mark App Automate Session Status Browserstack

*** Test Cases ***

Launch Application
    Browserstack.Launch iOS Application On Browserstack Device

Intro Screen UI Review
    OnboardingResourcesiOS.Check Data Alert iOS
    OnboardingResourcesiOS.Validate Intro Screen Details iOS

Sign Up - New User
    AuthenticationResourcesiOS.Sign Up As New User iOS

Complete User Onboarding
    OnboardingResourcesiOS.Complete User Onboarding iOS

Terms Of Use - Agree
    OnboardingResourcesiOS.Agree To Terms Of Use iOS

Add Weight To The Weight Card
    NutritionResourcesiOS.Add Weight To The Weight Card iOS    200

Add Water To The Water Card
    NutritionResourcesiOS.Add Water To The Water Card iOS
    
Log Food To Snacks
    NutritionResourcesiOS.Log Food iOS    ${snacksBtniOS}    Apple

Log Food To Dinner
    NutritionResourcesiOS.Log Food iOS    ${dinnerBtniOS}    Pasta

Log Food To Lunch
    NutritionResourcesiOS.Log Food iOS    ${lunchBtniOS}    Pizza

Log Food To Breakfast
    NutritionResourcesiOS.Log Food iOS    ${breakfastBtniOS}    Avocado

Add Custom Food
    NutritionResourcesiOS.Add Custom Food iOS    Test Food Item    Test Brand    1    100

Log Out From The Main Menu
    AccountMgmtResourcesiOS.Log Out iOS

Sign In - Existing User
    OnboardingResourcesiOS.Check Data Alert iOS
    AuthenticationResourcesiOS.Sign In As Existing User iOS
    OnboardingResourcesiOS.Check Notifications Alert iOS

Shop Dashboard UI And Details
    ShopWooResourcesiOS.Open Shop iOS
    ShopWooResourcesiOS.Validate Dashboard UI And Details iOS
    ShopWooResourcesiOS.Close Shop iOS
