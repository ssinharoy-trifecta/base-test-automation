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
Resource   ../../../Common/Resources/CommonApps.robot

Test Teardown     Run Keyword If Test Failed    Fatal Error

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Application
    Launch Android Application On Emulator

Sign In As Existing User
    Sign In As Existing User Android

# Review My Day UI - Food Logged
#     NutritionResourcesAndroid.Review My Day UI - Food Logged Android

# Review Calories Weekly UI - Food Logged
#     NutritionResourcesAndroid.Review Calories Weekly UI - Food Logged Android

# Review Nutrients Weekly UI - Food Logged
#     NutritionResourcesAndroid.Review Nutrients Weekly UI - Food Logged Android

# Review Calories Daily UI - Food Logged
#     NutritionResourcesAndroid.Review Calories Daily UI - Food Logged Android

# Review Nutrients Daily UI - Food Logged
#     NutritionResourcesAndroid.Review Nutrients Daily UI - Food Logged Android

# Review Weight UI - Weight Logged
#     NutritionResourcesAndroid.Review Weight UI - Weight Logged Android

# Add New Weight To The Weight Log
#     NutritionResourcesAndroid.Add New Weight To The Weight Log Android    180 lbs

Review Nutrition Goals UI
    NutritionResourcesAndroid.Review Nutrition Goals UI Android

Update Nutrition Goals For Non-Premium Users
    NutritionResourcesAndroid.Update Nutrition Goals For Non-Premium Users Android

Use Recommended Values For Non-Premium Users
    NutritionResourcesAndroid.Use Recommended Values For Non-Premium Users Android