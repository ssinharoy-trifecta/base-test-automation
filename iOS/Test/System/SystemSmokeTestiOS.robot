*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/Feature/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/Feature/AuthenticationResourcesiOS.robot
Resource   ../../Resources/Feature/FitnessResourcesiOS.robot
Resource   ../../Resources/Feature/NutritionResourcesiOS.robot
Resource   ../../Resources/Feature/OnboardingResourcesiOS.robot
Resource   ../../Resources/Feature/ShopWooResourcesiOS.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot
Resource   ../../../Common/Resources/CommonApps.robot

Suite Setup       Browserstack.Upload iOS Application To Browserstack
Suite Teardown    Run Keyword If All Tests Passed    Browserstack.Mark App Automate Session Status Passed

Test Teardown     Run Keyword If Test Failed    Browserstack.Mark App Automate Session Status Failed

*** Test Cases ***

Launch Application
    Browserstack.Launch iOS Application On Browserstack Device  ${configBS}

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

Review Main Menu UI
    AccountMgmtResourcesiOS.Review Main Menu UI iOS

Review User Account UI
    AccountMgmtResourcesiOS.Review User Account UI iOS

Reset User Password
    AccountMgmtResourcesiOS.Reset User Password iOS

Update User Name
    AccountMgmtResourcesiOS.Update User Name iOS    Trifecta Tester

Review Privacy Policy
    AccountMgmtResourcesiOS.Review Info WebView iOS    ${privacyPolicyBtniOS}   ${privacyBodyTxtiOS}

Review Terms Of Service
    AccountMgmtResourcesiOS.Review Info WebView iOS    ${termsOfServiceBtniOS}    ${termsOfServiceBodyTxtiOS}

Review Premium Subscription Information
    AccountMgmtResourcesiOS.Review Info WebView iOS    ${premiumSubscriptionInformationBtniOS}    ${premiumSubscriptionBodyTxtiOS}

Review Your California Privacy Rights
    AccountMgmtResourcesiOS.Review Info WebView iOS    ${yourCaliforniaPrivacyRightsBtniOS}    ${californiaPrivacyRightsBodyTxtiOS}

Review Do Not Sell My Information
    AccountMgmtResourcesiOS.Review Info WebView iOS    ${doNotSellMyPersonalInformationBtniOS}    ${doNotSellMyInformationBodyTxtiOS}

Review Workout Details
    FitnessResourcesiOS.Review Workout Details iOS

Save to Workout Library
    FitnessResourcesiOS.Save to Workout Library iOS

Review Workout Library UI
    FitnessResourcesiOS.Review Workout Library UI iOS

Review Stopwatch UI
    FitnessResourcesiOS.Launch And Validate Timer iOS    ${stopwatchBtnFitnessiOS}

Review Countdown UI
    FitnessResourcesiOS.Launch And Validate Timer iOS    ${countdownBtnFitnessiOS}

Review Interval UI
    FitnessResourcesiOS.Launch And Validate Timer iOS    ${intervalBtnFitnessiOS}

Review Tabata UI
    FitnessResourcesiOS.Launch And Validate Timer iOS    ${tabataBtnFitnessiOS}

Log Out
    AccountMgmtResourcesiOS.Log Out iOS

Sign In - Existing User
    OnboardingResourcesiOS.Check Data Alert iOS
    AuthenticationResourcesiOS.Sign In As Existing User iOS
    OnboardingResourcesiOS.Check Notifications Alert iOS

Add New Workout For Time
    FitnessResourcesiOS.Add New Workout For Time iOS

Review Movements Library UI
    FitnessResourcesiOS.Review Movements Library UI iOS

Validate Movement Video Content
    FitnessResourcesiOS.Validate Movement Video Content iOS

# Shop Dashboard UI And Details
#     ShopWooResourcesiOS.Open Shop iOS
#     ShopWooResourcesiOS.Validate Dashboard UI And Details iOS
#     ShopWooResourcesiOS.Close Shop iOS
