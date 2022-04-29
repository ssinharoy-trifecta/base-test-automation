*** Settings ***

Library    Process

*** Variables ***
#COMMON
${BS_REMOTE_URL}                hub-cloud.browserstack.com/wd/hub
${BS_APP_AUTOMATE_CLOUD_API}    api-cloud.browserstack.com/app-automate
${BS_USER}                      tylerthomas6    
${BS_KEY}                       FQtVoY5xMMxVa9bh1c1Z       
${BS_IDLE_TIMEOUT}              5

#iOS
${APP_FILE_iOS}           iOS/Resources/System/AppFileiOS/TrifectaAppiOS.ipa
${BS_CUSTOM_ID_iOS}       TrifectaAppiOS
${BS_APP_UPLOADER_iOS}    curl -u "${BS_USER}:${BS_KEY}" 
...                       -X POST "https://${BS_APP_AUTOMATE_CLOUD_API}/upload" 
...                       -F "file=@${APP_FILE_iOS}" 
...                       -F "custom_id=${BS_CUSTOM_ID_iOS}"
${BS_PROJECT_iOS}         iOS System Smoke Test
${BS_BUILD_iOS}           iOS
${BS_NAME_iOS}            iOS_System_Smoke_Test
${BS_DEVICE_iOS}          iPhone 13
${BS_OS_VERSION_iOS}      15

#ANDROID
${APP_FILE_ANDROID}           Android/Resources/System/AppFileAndroid/TrifectaAppAndroid.apk
${BS_CUSTOM_ID_ANDROID}       TrifectaAppAndroid
${BS_APP_UPLOADER_ANDROID}    curl -u "${BS_USER}:${BS_KEY}" 
...                           -X POST "https://${BS_APP_AUTOMATE_CLOUD_API}/upload" 
...                           -F "file=@${APP_FILE_ANDROID}" 
...                           -F "custom_id=${BS_CUSTOM_ID_ANDROID}"
${BS_PROJECT_ANDROID}         Android System Smoke Test
${BS_BUILD_ANDROID}           Android
${BS_NAME_ANDROID}            Android_System_Smoke_Test
${BS_DEVICE_ANDROID}          Google Pixel 3
${BS_OS_VERSION_ANDROID}      9.0

#WEB
${BS_OS}                Windows
${BS_PC_OS_VERSION}     10
${BS_BROWSER}           chrome
${BS_BROWSER_VERSION}   98
${BS_BUILD_WEB}         ${SUITE NAME}

*** Keywords ***

#MARK APP AUTOMATE SESSION STATUS PASS/FAIL IN BROWSERSTACK
Mark App Automate Session Status Browserstack
    Run Keyword If All Tests Passed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}
    Run Keyword If Any Tests Failed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed"}}
    Close All Applications

#UPLOAD APPLICATION TO BROWSERSTACK CLOUD API
Upload iOS Application To Browserstack
   Run Process     ${BS_APP_UPLOADER_iOS}    shell=True   alias=UploadiOSApp
   Wait For Process     UploadiOSApp    timeout=30

Upload Android Application To Browserstack
   Run Process     ${BS_APP_UPLOADER_ANDROID}    shell=True   alias=UploadAndroidApp
   Wait For Process     UploadAndroidApp    timeout=30

#iOS BROWSERSTACK LAUNCHER
Launch iOS Application On Browserstack
    Open Application    remote_url=http://${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app_url=${BS_CUSTOM_ID_iOS}
    ...                 device=${BS_DEVICE_iOS}
    ...                 os_version=${BS_OS_VERSION_iOS}
    ...                 project=${BS_PROJECT_iOS} 
    ...                 build=${BS_BUILD_iOS}
    ...                 name=${BS_NAME_iOS}
    ...                 browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

#ANDROID BROWSERSTACK LAUNCHER
Launch Android Application On Browserstack
    Open Application    remote_url=http://${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app_url=${BS_CUSTOM_ID_iOS}
    ...                 device=${BS_DEVICE_ANDROID}
    ...                 os_version=${BS_OS_VERSION_ANDROID}
    ...                 project=${BS_PROJECT_ANDROID}
    ...                 build=${BS_BUILD_ANDROID}
    ...                 name=${BS_NAME_ANDROID}
    ...                 browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

# WEB BROWSERSTACK LAUNCHER
Setup Browserstack For WEB
  [Arguments]                 ${urlForNavigation}
  ${remoteUrl}                Set Variable          http://${BS_USER}:${BS_KEY}@${BS_REMOTE_URL}
  &{desiredCapabilities}      Create Dictionary   
  ...                         os=${BS_OS}     
  ...                         os_version=${BS_PC_OS_VERSION}     
  ...                         browser=${BS_BROWSER}   
  ...                         browser_version=${BS_BROWSER_VERSION}
  ...                         build=${BS_BUILD_WEB}
  ...                         name=${TEST NAME}
  Open Browser                ${urlForNavigation}
  ...                         remote_url=${remoteUrl}     
  ...                         desired_capabilities=${desiredCapabilities}
  Begin Maximize Browser Test
