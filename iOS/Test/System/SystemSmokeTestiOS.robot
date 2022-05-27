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

# TODO: COULD POTENTIALLY COMBINE KEYWORDS INTO ONE
Suite Setup       Browserstack.Upload iOS Application To Browserstack
Suite Teardown    Run Keywords    AccountMgmtResourcesiOS.Log Out iOS
...                               Browserstack.Mark App Automate Session Status Browserstack

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

Log Out
    AccountMgmtResourcesiOS.Log Out iOS

Sign In - Existing User
    OnboardingResourcesiOS.Check Data Alert iOS
    AuthenticationResourcesiOS.Sign In As Existing User iOS
    OnboardingResourcesiOS.Check Notifications Alert iOS

# Review Workout Library UI
#     Review Workout Library UI iOS

# Review Movements Library UI
#     Review Movements Library UI iOS

# Shop Dashboard UI And Details
#     ShopWooResourcesiOS.Open Shop iOS
#     ShopWooResourcesiOS.Validate Dashboard UI And Details iOS
#     ShopWooResourcesiOS.Close Shop iOS
