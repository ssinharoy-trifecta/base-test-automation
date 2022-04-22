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
Resource   ../../Resources/System/XcodeEmulatorResourcesiOS.robot

Suite Setup       Set Library Search Order    AppiumLibrary    SeleniumLibrary

#BROWSERSTACK ONLY
Suite Teardown    Mark App Automate Session Status Browserstack

*** Test Cases ***

Test Launch Application iOS
    #Launch iOS Application On Browserstack
    Launch iOS App Xcode Emulator

Test Sign Up - New User
    Check Data Alert iOS
    Sign Up As New User iOS

Test Complete User Onboarding
    Complete User Onboarding iOS

Test Log Out iOS 1
    Log Out iOS

Test Sign In As Existing User iOS
    Check Data Alert iOS
    Sign In As Existing User iOS
    Check Notifications Alert iOS

Test Dashboard UI And Details iOS
    Open Shop iOS
    Validate Dashboard UI And Details iOS
    Close Shop iOS
    
Test Log Out iOS 2
    Log Out iOS
