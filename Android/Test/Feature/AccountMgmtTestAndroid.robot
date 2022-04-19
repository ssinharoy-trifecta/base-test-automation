*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

Resource   ../../Resources/AccountMgmtResourcesAndroid.robot
Resource   ../../Resources/AuthenticationResourcesAndroid.robot
Resource   ../../Resources/FitnessResourcesAndroid.robot
Resource   ../../Resources/NutritionResourcesAndroid.robot
Resource   ../../Resources/OnboardingResourcesAndroid.robot
Resource   ../../Resources/ShopWooResourcesAndroid.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Setup       Launch Application Android
Suite Teardown    Mark App Automate Session Status Browserstack

*** Test Cases ***