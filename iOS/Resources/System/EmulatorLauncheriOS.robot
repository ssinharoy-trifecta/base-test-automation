*** Variables ***

${LOCAL_HOST_IOS}          http://localhost:4723/wd/hub
${PLATFORM_VERSION_IOS}    15
${UDID_IOS}                26C2F6DE-2080-4066-A8B9-52181FC0E76A
${BUNDLE_ID_IOS}           com.dmw.iCrossFit
${DEVICE_NAME_IOS}         iPhone 13 Pro

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
