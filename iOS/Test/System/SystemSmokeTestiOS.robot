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
Resource   ../../Resources/System/BrowserstackResourcesiOS.robot
Resource   ../../Resources/System/EmulatorResourcesiOS.robot

Suite Setup    Set Library Search Order    AppiumLibrary    SeleniumLibrary

#BROWSERSTACK
Suite Teardown    Run Keywords    Log Out iOS
...                               Mark App Automate Session Status Browserstack

#XCODE EMULATOR
# Suite Teardown    Run Keywords    Log Out iOS

*** Test Cases ***

Launch Application T102659
    Launch iOS Application On Browserstack
    #Launch iOS App On Xcode Emulator

Intro Screen UI Review T100431
    Check Data Alert iOS

Sign Up - New User T100433
    Sign Up As New User iOS

Complete User Onboarding T100621
    Complete User Onboarding iOS

Terms Of Use - Agree T101518
    Agree To Terms Of Use

Log Out From the Main Menu T100460
    Log Out iOS

Sign In - Existing User T100505
    Check Data Alert iOS
    Sign In As Existing User iOS
    Check Notifications Alert iOS

Shop Dashboard UI And Details T100761
    Open Shop iOS
    Validate Dashboard UI And Details iOS
    Close Shop iOS
