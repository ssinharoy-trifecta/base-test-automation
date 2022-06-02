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
Resource   ../../../Common/Resources/CommonApps.robot

#THIS IS A WORKING SPACE FOR TEST CASES DEVELOPMENT
*** Test Cases ***

Launch Application
    Launch Android Application On Emulator
