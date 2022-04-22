*** Settings ***

*** Variables ***

*** Keywords ***

#LAUNCH THE APP ON XCODE EMULATOR
Launch iOS App On Xcode Emulator
    Open Application    http://localhost:4723/wd/hub
    ...                 platformName=iOS
    ...                 platformVersion=15
    ...                 udid=7DDC7B2F-C731-4B3F-8D90-F698CECBAE2D
    ...                 bundleId=com.dmw.iCrossFit
    ...                 deviceName=iPhone 13 mini
    ...                 automationName=XCUITest