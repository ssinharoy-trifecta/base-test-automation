*** Settings ***

*** Variables ***

${LOCAL_HOST_ANDROID}           http://localhost:4723/wd/hub
${PLATFORM_VERSION_ANDROID}     12
${DEVICE_NAME_ANDROID}          99051FFBA006Z4
${APP_PACKAGE_ANDROID}          com.n_ix.pocket_wod
${APP_ACTIVITY_MAIN_ANDROID}    com.n_ix.pocket_wod.activities.main.MainActivity
${APP_ACTIVITY_AUTH_ANDROID}    com.n_ix.pocket_wod.activities.auth.AuthActivity

*** Keywords ***

Launch Android Application on Emulator
    Open Application    ${LOCAL_HOST_ANDROID}
    ...                 platformName=Android
    ...                 platformVersion=${PLATFORM_VERSION_ANDROID}
    ...                 deviceName=${DEVICE_NAME_ANDROID}
    ...                 appPackage=${APP_PACKAGE_ANDROID} 
    ...                 appActivity=${APP_ACTIVITY_MAIN_ANDROID}
    ...                 appActivity=$${APP_ACTIVITY_AUTH_ANDROID}
    ...                 automationName=Uiautomator2
    ...                 autoGrantPermissions=true
