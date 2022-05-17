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

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Aplication On Emulator
    Launch iOS Application On Emulator

# Review Main Menu UI
#     Review Main Menu UI iOS

# Review User Account UI
#     Review User Account UI iOS

# Reset User Password
#     Reset User Password iOS

# Update User Name
#     Update User Name iOS

# Review Privacy Policy
#     Review Privacy Policy iOS

Review Terms Of Service
    Review Terms Of Service iOS

Review Premium Subscription Information
    Review Premium Subscription Information iOS

Review Your California Privacy Rights
    Review Your California Privacy Rights iOS

Review Do Not Sell My Information
    Review Do Not Sell My Information iOS
