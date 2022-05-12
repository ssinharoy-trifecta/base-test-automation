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
Resource   ../../Resources/System/EmulatorLauncherAndroid.robot

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Application
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Launch Android Application On Emulator
