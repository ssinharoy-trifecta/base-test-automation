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
Resource   ../../Resources/System/EmulatorResourcesAndroid.robot
Resource   ../../Resources/System/BrowserstackResourcesAndroid.robot

Suite Setup    Set Library Search Order    AppiumLibrary    SeleniumLibrary

#BROWSERSTACK
Suite Teardown    Run Keywords    Log Out Android
...                               Mark App Automate Session Status Browserstack

*** Test Cases ***

Launch Application T102659
    Launch Android Application On Browserstack
    #Launch Android Application On Emulator

Intro Screen UI Review T100431
    Validate Intro Screen Details Android

Sign Up - New User T100433
    Sign Up As New User Android

Complete User Onboarding T100621
    Complete User Onboarding Android

Terms Of Use - Agree T101518
    Agree To Terms Of Use Android

Log Out From The Main Menu T100460
    Log Out Android

Sign In - Existing User T100505
    Sign In As Existing User Android

Shop Dashboard UI And Details T100761
    Open Shop Android
    Validadate Dashboard UI And Details Android
    Close Shop Android



