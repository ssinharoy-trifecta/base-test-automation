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

Test Launch Trifecta Application
    #LAUNCH THE APP ON BROWSERSTACK EMULATOR
    Open Application    remote_url=http://hub-cloud.browserstack.com/wd/hub
    ...                 browserstack.user=tylerthomas6    
    ...                 browserstack.key=FQtVoY5xMMxVa9bh1c1Z
    ...                 app=bs://362fd79ea6457c0bbd9feb481bfe4ec65dbbc2d7
    ...                 device=iPhone 13
    ...                 os_version=15
    ...                 project=iOS System Smoke Test
    ...                 build=iOS 
    ...                 name=iOS_System_Smoke_Test
    ...                 browserstack.idleTimeout=5

    # LAUNCH THE APP ON XCODE EMULATOR
    # Open Application    http://localhost:4723/wd/hub
    # ...                 platformName=iOS
    # ...                 platformVersion=15
    # ...                 udid=7DDC7B2F-C731-4B3F-8D90-F698CECBAE2D
    # ...                 bundleId=com.dmw.iCrossFit
    # ...                 deviceName=iPhone 13 mini
    # ...                 automationName=XCUITest

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
