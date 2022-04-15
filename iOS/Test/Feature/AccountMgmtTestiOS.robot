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

Suite Teardown    Mark App Automate Session Satus Browserstack

*** Test Cases ***
