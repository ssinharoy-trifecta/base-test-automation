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

# Review Workout Library UI
#     Review Workout Library UI iOS

# Review Movements Library UI
#     Review Movements Library UI iOS

# Review Workout Details
#     Review Workout Details iOS

# Save to Workout Library
#     Save to Workout Library iOS

# Review Fitness Tools UI
#     Review Fitness Tools UI iOS

Add New Workout For Time
    Add New Workout For Time iOS
