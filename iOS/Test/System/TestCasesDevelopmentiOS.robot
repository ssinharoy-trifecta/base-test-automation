*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/Feature/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/Feature/AuthenticationResourcesiOS.robot
Resource   ../../Resources/Feature/FitnessResourcesiOS.robot
Resource   ../../Resources/Feature/NutritionResourcesiOS.robot
Resource   ../../Resources/Feature/OnboardingResourcesiOS.robot
Resource   ../../Resources/Feature/ShopWooResourcesiOS.robot
Resource   ../../Resources/System/EmulatorLauncheriOS.robot
Resource   ../../../Common/Resources/CommonApps.robot

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Aplication On Emulator
    Launch iOS Application On Emulator

Review My Day UI - Food Logged
    Review My Day UI - Food Logged iOS

Review Calories Daily UI - Food Logged
    Review Calories Daily UI - Food Logged iOS

Review Calories Weekly UI - Food Logged
    Review Calories Weekly UI - Food Logged iOS

Review Nutrients Daily UI - Food Logged
    Review Nutrients Daily UI - Food Logged iOS

Review Nutrients Weekly UI - Food Logged
    Review Nutrients Weekly UI - Food Logged iOS

Review Weight UI - Weight Logged
    Review Weight UI - Weight Logged iOS

Add New Weight To The Weight Log
    Add New Weight To The Weight Log iOS    180

Review Nutrition Goals UI
    Review Nutrition Goals UI iOS

Update Nutrition Goals For Non-Premium Users
    Update Nutrition Goals For Non-Premium Users iOS

Use Recommended Values For Non-Premium Users
    Use Recommended Values For Non-Premium Users iOS
