*** Settings ***

*** Variables ***

${LOCAL_HOST_IOS}          http://localhost:4723/wd/hub
${PLATFORM_VERSION_IOS}    15
${UDID_IOS}                7DDC7B2F-C731-4B3F-8D90-F698CECBAE2D
${BUNDLE_ID_IOS}           com.dmw.iCrossFit
${DEVICE_NAME_IOS}         iPhone 13 mini

*** Keywords ***

#LAUNCH THE APP ON XCODE EMULATOR
Launch iOS Application On Emulator
    Open Application    ${LOCAL_HOST_IOS}
    ...                 platformName=iOS
    ...                 platformVersion=${PLATFORM_VERSION_IOS}
    ...                 udid=${UDID_IOS}
    ...                 bundleId=${BUNDLE_ID_IOS} 
    ...                 deviceName=${DEVICE_NAME_IOS}
    ...                 automationName=XCUITest
