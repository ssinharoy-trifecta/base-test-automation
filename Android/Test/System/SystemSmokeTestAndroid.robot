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

Test Launch Trifecta Application
    Open Application    remote_url=http://hub-cloud.browserstack.com/wd/hub
    ...                 browserstack.user=tylerthomas6    
    ...                 browserstack.key=FQtVoY5xMMxVa9bh1c1Z
    ...                 app=bs://a4d0becc184bdf02f991641ed71600aabbb2f8fa
    ...                 device=Google Pixel 3
    ...                 os_version=9.0
    ...                 project=Android System Smoke Test
    ...                 build=Android 
    ...                 name=Android_System_Smoke_Test
    ...                 browserstack.idleTimeout=5

Test Sign In As Existing User Android
    Sign In As Existing User Android

# Test Dashboard UI and Details Android
#     Open Shop Android
#     Validadate Dashboard UI And Details Android
#     Close Shop Android

Test Log Out Android
    Log Out Android

