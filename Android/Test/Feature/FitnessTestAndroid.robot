*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/AccountMgmtResourcesAndroid.robot
Resource   ../../Resources/AuthenticationResourcesAndroid.robot
Resource   ../../Resources/FitnessResourcesAndroid.robot
Resource   ../../Resources/NutritionResourcesAndroid.robot
Resource   ../../Resources/OnboardingResourcesAndroid.robot
Resource   ../../Resources/ShopResourcesAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Teardown    Mark App Automate Session Satus Browserstack

*** Test Cases ***
