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

Suite Setup       Launch Android Application On Browserstack
Suite Teardown    Mark App Automate Session Status Browserstack

*** Test Cases ***

Test Sign In As Existing User Android
    Sign In As Existing User Android

Test Dashboard UI and Details Android
    Open Shop Android
    Validadate Dashboard UI And Details Android
    Close Shop Android

Test Log Out Android
    Log Out Android

