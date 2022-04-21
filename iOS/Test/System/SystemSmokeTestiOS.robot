*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

#SETS AN ORDER TO CHOSE A LIBRARY IF A KEYWORD EXISTS IN BOTH LIBRARIES E.G. CLICK ELEMENT
| Suite Setup | Set Library Search Order | AppiumLibrary | SeleniumLibrary

Resource   ../../Resources/Feature/AccountMgmtResourcesiOS.robot
Resource   ../../Resources/Feature/AuthenticationResourcesiOS.robot
Resource   ../../Resources/Feature/FitnessResourcesiOS.robot
Resource   ../../Resources/Feature/NutritionResourcesiOS.robot
Resource   ../../Resources/Feature/OnboardingResourcesiOS.robot
Resource   ../../Resources/Feature/ShopWooResourcesiOS.robot
Resource   ../../Resources/System/BrowserstackResourcesiOS.robot
# Resource    ../../../Common/Resources/Authentication/CustomerCreate.robot

# Suite Setup       Launch Application Browserstack iOS
Suite Teardown    Mark App Automate Session Status Browserstack

*** Test Cases ***

Test Launch Browserstack
    Launch Application iOS

#LAUNCH THE APP ON XCODE EMULATOR
# Test Launch App on iOS Emulator
#     Open Application    http://localhost:4723/wd/hub
#     ...                 platformName=iOS
#     ...                 platformVersion=15
#     ...                 udid=7DDC7B2F-C731-4B3F-8D90-F698CECBAE2D
#     ...                 bundleId=com.dmw.iCrossFit
#     ...                 deviceName=iPhone 13 mini
#     ...                 automationName=XCUITest

Test Sign Up - New User
    Check Data Alert iOS
    Sign Up As New User iOS

Test Complete User Onboarding
    Complete User Onboarding iOS

# Test Sign In As Existing User iOS
#     Check Data Alert iOS
#     Sign In As Existing User iOS
#     Check Notifications Alert iOS

Test Log Out iOS
    Log Out iOS

# Test Sign In As Existing User iOS
#     Check Data Alert iOS
#     Sign In As Existing User iOS
#     Check Notifications Alert iOS

# Test Dashboard UI And Details iOS
#     Open Shop iOS
#     Validate Dashboard UI And Details iOS
#     Close Shop iOS
    
# Test Log Out iOS
#     Log Out iOS
