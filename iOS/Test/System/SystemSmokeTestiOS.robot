*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

Resource   ../../Resources/Feature/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/Feature/AuthenticationResourcesiOS.robot
Resource   ../../Resources/Feature/FitnessResourcesiOS.robot
Resource   ../../Resources/Feature/NutritionResourcesiOS.robot
Resource   ../../Resources/Feature/OnboardingResourcesiOS.robot
Resource   ../../Resources/Feature/ShopWooResourcesiOS.robot
Resource   ../../Resources/System/EmulatorLauncheriOS/EmulatorLauncheriOS.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Setup    Set Library Search Order    AppiumLibrary    SeleniumLibrary

#BROWSERSTACK
Suite Teardown    Run Keywords    Log Out iOS
...                               Mark App Automate Session Status Browserstack

#XCODE EMULATOR
# Suite Teardown    Run Keywords    Log Out iOS

*** Test Cases ***

Upload iOS Application To Browserstack
    Upload iOS Application To Browserstack

Launch Application
    Launch iOS Application On Browserstack
    #Launch iOS Application On Emulator

Intro Screen UI Review
    Check Data Alert iOS
    Validate Intro Screen Details iOS

# Sign Up - New User
#     Sign Up As New User iOS

# Complete User Onboarding
#     Complete User Onboarding iOS

# Terms Of Use - Agree
#     Agree To Terms Of Use iOS

# Log Out From The Main Menu
#     Log Out iOS

Sign In - Existing User
    Check Data Alert iOS
    Sign In As Existing User iOS
    Check Notifications Alert iOS

# Shop Dashboard UI And Details
#     Open Shop iOS
#     Validate Dashboard UI And Details iOS
#     Close Shop iOS
