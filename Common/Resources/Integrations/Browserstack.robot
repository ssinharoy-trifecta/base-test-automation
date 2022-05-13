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
${APP_FILE_iOS}           iOS/Resources/System/TrifectaAppiOS.ipa
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
${APP_FILE_ANDROID}           Android/Resources/System/TrifectaAppAndroid.apk
${BS_CUSTOM_ID_ANDROID}       TrifectaAppAndroid
${BS_APP_UPLOADER_ANDROID}    curl -u "${BS_USER}:${BS_KEY}" 
...                           -X POST "https://${BS_APP_AUTOMATE_CLOUD_API}/upload" 
...                           -F "file=@${APP_FILE_ANDROID}" 
...                           -F "custom_id=${BS_CUSTOM_ID_ANDROID}"
${BS_PROJECT_ANDROID}         Android System Smoke Test
${BS_BUILD_ANDROID}           Android
${BS_NAME_ANDROID}            Android_System_Smoke_Test
${BS_DEVICE_ANDROID}          Google Pixel 6
${BS_OS_VERSION_ANDROID}      12.0

#WEB
${BS_BUILD_WEB}         ${SUITE NAME}

#CONFIG BROWSERSTACK WEB DICTIONARIES
&{win10ChromeDict}               
  ...                         os=Windows     
  ...                         os_version=10    
  ...                         browser=chrome   
  ...                         browser_version=98
&{win11ChromeDict}              
  ...                         os=Windows     
  ...                         os_version=11    
  ...                         browser=edge   
  ...                         browser_version=98
&{macCatalinaSafariDict}            
  ...                         os=OS X     
  ...                         os_version=Catalina    
  ...                         browser=safari   
  ...                         browser_version=13.1
&{macMontereySafariDict}            
  ...                         os=OS X     
  ...                         os_version=Monterey  
  ...                         browser=safari   
  ...                         browser_version=15.3
  
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
# TODO: Instead of using the Run Process keyword, try API.Send POST Request
   Run Process          ${BS_APP_UPLOADER_iOS}    shell=True   alias=UploadiOSApp
   Wait For Process     UploadiOSApp    timeout=30

Upload Android Application To Browserstack
   Run Process         ${BS_APP_UPLOADER_ANDROID}    shell=True   alias=UploadAndroidApp
   Wait For Process    UploadAndroidApp    timeout=30

#iOS BROWSERSTACK LAUNCHER
Launch iOS Application On Browserstack Device
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
Launch Android Application On Browserstack Device
    Open Application    remote_url=http://${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app_url=${BS_CUSTOM_ID_ANDROID}
    ...                 device=${BS_DEVICE_ANDROID}
    ...                 os_version=${BS_OS_VERSION_ANDROID}
    ...                 project=${BS_PROJECT_ANDROID}
    ...                 build=${BS_BUILD_ANDROID}
    ...                 name=${BS_NAME_ANDROID}
    ...                 browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

# WEB BROWSERSTACK LAUNCHER
Setup Browserstack For WEB
  [Arguments]                    ${urlForNavigation}         ${configBS}
  ${remoteUrl}                   Set Variable                http://${BS_USER}:${BS_KEY}@${BS_REMOTE_URL}
  &{desiredCapabilities}=        Set Desired Capabilities    ${configBS}
  ${desiredCapabilities.build}=  Set Variable                ${BS_BUILD_WEB}
  ${desiredCapabilities.name}=   Set Variable                ${TEST NAME}
  Open Browser                   ${urlForNavigation}
  ...                            remote_url=${remoteUrl}     
  ...                            desired_capabilities=${desiredCapabilities}
  Begin Maximize Browser Test

Set Desired Capabilities
  [Arguments]        ${configBS}
  IF                 '${configBS}' == 'macCatalinaSafari'
    ${returnValue}=  Set Variable     ${macCatalinaSafariDict}
  ELSE IF            '${configBS}' == 'macMontereySafari'
    ${returnValue}=  Set Variable     ${macMontereySafariDict}
  ELSE IF            '${configBS}' == 'win11Chrome'
    ${returnValue}=  Set Variable     ${win11ChromeDict}
  ELSE
    ${returnValue}=  Set Variable     ${win10ChromeDict}
  END
  [Return]           ${returnValue}
