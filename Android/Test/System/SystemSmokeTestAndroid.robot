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
Resource   ../../Resources/System/EmulatorLauncherAndroid/EmulatorLauncherAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Setup       Upload Android Application To Browserstack
Suite Teardown    Run Keywords    Log Out Android
...                               Mark App Automate Session Status Browserstack

*** Test Cases ***

Launch Application
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Launch Android Application On Browserstack Device
    #Launch Android Application On Emulator

Intro Screen UI Review
    Validate Intro Screen Details Android

Sign Up - New User
    Sign Up As New User Android

Complete User Onboarding
    Complete User Onboarding Android

Terms Of Use - Agree
    Agree To Terms Of Use Android

Log Out From The Main Menu
    Log Out Android

Sign In - Existing User
    Sign In As Existing User Android

Shop Dashboard UI And Details
    Open Shop Android
    Validadate Dashboard UI And Details Android
    Close Shop Android
