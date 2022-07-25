*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/Feature/AccountMgmtResourcesAndroid.robot
Resource   ../../Resources/Feature/AuthenticationResourcesAndroid.robot
Resource   ../../Resources/Feature/FitnessResourcesAndroid.robot
Resource   ../../Resources/Feature/NutritionResourcesAndroid.robot
Resource   ../../Resources/Feature/OnboardingResourcesAndroid.robot
Resource   ../../Resources/Feature/ShopWooResourcesAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot
Resource   ../../../Common/Resources/CommonApps.robot
Variables  ../../../Common/Resources/GetEnvVars.py

Suite Setup       Browserstack.Upload Android Application To Browserstack   ${envPath}
Suite Teardown    Run Keyword If All Tests Passed    Browserstack.Mark App Automate Session Status Passed

Test Teardown     Run Keyword If Test Failed    Browserstack.Mark App Automate Session Status Failed

*** Variables ***
${envPath}  ${PATH_TO_ENV}

*** Test Cases ***

Launch Application
    Browserstack.Launch Android Application On Browserstack Device  ${configBS}   ${envPath}

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

Review Nutrition Goals UI
    NutritionResourcesAndroid.Review Nutrition Goals UI Android

Update Nutrition Goals For Non-Premium Users
    NutritionResourcesAndroid.Update Nutrition Goals For Non-Premium Users Android

Use Recommended Values For Non-Premium Users
    NutritionResourcesAndroid.Use Recommended Values For Non-Premium Users Android

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

Review My Day UI - Food Logged
    NutritionResourcesAndroid.Review Weekly View UI Analytics - Food Logged Android    ${myDayBtnAnalyticsAndroid}    ${myDayElementsAnalyticsAndroid}

Review Calories Weekly UI - Food Logged
    NutritionResourcesAndroid.Review Weekly View UI Analytics - Food Logged Android     ${caloriesBtnAnalyticsAndroid}    ${caloriesWeeklyElementsAnalyticsAndroid}

Review Nutrients Weekly UI - Food Logged
    NutritionResourcesAndroid.Review Weekly View UI Analytics - Food Logged Android     ${nutrientsBtnAnalyticsAndroid}    ${nutrientsWeeklyElementsAnalyticsAndroid}

Review Calories Daily UI - Food Logged
    NutritionResourcesAndroid.Review Daily View UI Analytics - Food Logged Android     ${caloriesBtnAnalyticsAndroid}    ${caloriesDailyElementsAnalyticsAndroid}

Review Nutrients Daily UI - Food Logged
    NutritionResourcesAndroid.Review Daily View UI Analytics - Food Logged Android     ${nutrientsBtnAnalyticsAndroid}    ${nutrientsDailyElementsAnalyticsAndroid}

Review Weight UI - Weight Logged
    NutritionResourcesAndroid.Review Weekly View UI Analytics - Food Logged Android     ${weightBtnAnalyticsAndroid}    ${weightElementsAnalyticsAndroid}

Add New Weight To The Weight Log
    NutritionResourcesAndroid.Add New Weight To The Weight Log Android    180 lbs

Review Main Menu UI
    AccountMgmtResourcesAndroid.Review Main Menu UI Android

Review User Account UI
    AccountMgmtResourcesAndroid.Review User Account UI Android

Reset User Password
    AccountMgmtResourcesAndroid.Reset User Password Android

Review Privacy Policy
    AccountMgmtResourcesAndroid.Review Info WebView Android    Privacy policy

Review Terms Of Service
    AccountMgmtResourcesAndroid.Review Info WebView Android    Terms of service

Review Premium Subscription Information
    AccountMgmtResourcesAndroid.Review Info WebView Android    Premium subscription information

Review Your California Privacy Rights
    AccountMgmtResourcesAndroid.Review Info WebView Android    Your California privacy rights

Review Do Not Sell My Information
    AccountMgmtResourcesAndroid.Review Info WebView Android    Do not sell my personal information

Review Workout Details
    FitnessResourcesAndroid.Review Workout Details Android

Save to Workout Library
    FitnessResourcesAndroid.Save to Workout Library Android

Review Workout Library UI
    FitnessResourcesAndroid.Review Workout Library UI Android

Review Stopwatch UI
    FitnessResourcesAndroid.Launch And Validate Timer Android    STOPWATCH

Review Countdown UI
    FitnessResourcesAndroid.Launch And Validate Timer Android    COUNTDOWN

Review Interval UI
   FitnessResourcesAndroid.Launch And Validate Timer Android    INTERVAL

Review Tabata UI
    FitnessResourcesAndroid.Launch And Validate Timer Android    TABATA

Log Out From My Account
    AccountMgmtResourcesAndroid.Log Out Android

Sign In - Existing User
    AuthenticationResourcesAndroid.Sign In As Existing User Android

Add New Workout For Time
    FitnessResourcesAndroid.Add New Workout For Time Android

Review Movements Library UI
    FitnessResourcesAndroid.Review Movements Library UI Android

Validate Movement Video Content
    FitnessResourcesAndroid.Validate Movement Video Content Android

# Shop Dashboard UI And Details
#     ShopWooResourcesAndroid.Open Shop Android
#     ShopWooResourcesAndroid.Validate Dashboard UI And Details Android
#     ShopWooResourcesAndroid.Close Shop Android
