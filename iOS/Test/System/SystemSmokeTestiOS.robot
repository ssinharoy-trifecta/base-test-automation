*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/AuthenticationResourcesiOS.robot
Resource   ../../Resources/FitnessResourcesiOS.robot
Resource   ../../Resources/NutritionResourcesiOS.robot
Resource   ../../Resources/OnboardingResourcesiOS.robot
Resource   ../../Resources/ShopWooResourcesiOS.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Setup       Launch Application iOS
Suite Teardown    Mark App Automate Session Satus Browserstack

*** Test Cases ***

Test Sign In As Existing User iOS
    Check Data Alert iOS
    Sign In As Existing User iOS
    Check Notifications Alert iOS

Test Dashboard UI And Details iOS
    Open Shop iOS
    Validate Dashboard UI And Details iOS
    Close Shop iOS
    
Test Log Out iOS
    Log Out iOS
