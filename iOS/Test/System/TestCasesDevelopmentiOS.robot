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

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Application
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Launch iOS Application On Emulator

Add Weight To The Weight Card
    Add Weight To The Weight Card iOS

Add Water To The Water Card
    Add Water To The Water Card