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
Resource   ../../Resources/System/EmulatorLauncheriOS.robot
Resource   ../../../Common/Resources/Integrations/Browserstack.robot

Suite Setup    Set Library Search Order    AppiumLibrary    SeleniumLibrary

#BROWSERSTACK
Suite Teardown    Run Keywords    Log Out iOS
...                               Mark App Automate Session Status Browserstack

#XCODE EMULATOR
# Suite Teardown    Run Keywords    Log Out iOS

*** Test Cases ***
