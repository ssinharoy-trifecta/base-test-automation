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

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Application
    Launch Android Application On Emulator

Sign In
    Sign In As Existing User Android

# Review Main Menu UI
#     Review Main Menu UI Android

Review User Account UI
    Review User Account UI Android

# Reset User Password
#     Reset User Password Android

# Update User Name
#     Update User Name Android

# Review Privacy Policy
#     Review Privacy Policy Android

# Review Terms Of Service
#     Review Terms Of Service Android

# Review Premium Subscription Information
#     Review Premium Subscription Information Android

# Review Your California Privacy Rights
#     Review Your California Privacy Rights Android

# Review Do Not Sell My Information
#     Review Do Not Sell My Information Android
