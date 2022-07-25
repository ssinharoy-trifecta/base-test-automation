*** Settings ***

Library     Process
Library     ../GetEnvVars.py
Resource    API.robot

*** Variables ***
#COMMON
${BS_REMOTE_URL}                hub-cloud.browserstack.com/wd/hub
${BS_APP_AUTOMATE_CLOUD_API}    api-cloud.browserstack.com/app-automate
${BS_IDLE_TIMEOUT}              5
${configBS}                     win10Chrome

#iOS
${APP_FILE_iOS}           iOS/Resources/System/TrifectaAppiOS.ipa
${BS_CUSTOM_ID_iOS}       TrifectaAppiOS
${BS_PROJECT_iOS}         iOS System Smoke Test
${BS_BUILD_iOS}           iOS
${BS_NAME_iOS}            iOS_System_Smoke_Test
${BS_DEVICE_iOS}          iPhone 13 Pro
${BS_OS_VERSION_iOS}      15

#ANDROID
${APP_FILE_ANDROID}           Android/Resources/System/TrifectaAppAndroid.apk
${BS_CUSTOM_ID_ANDROID}       TrifectaAppAndroid
${BS_PROJECT_ANDROID}         Android System Smoke Test
${BS_BUILD_ANDROID}           Android
${BS_NAME_ANDROID}            Android_System_Smoke_Test
${BS_DEVICE_ANDROID}          Google Pixel 6
${BS_OS_VERSION_ANDROID}      12.0

#WEB
${BS_BUILD_WEB}         ${SUITE NAME}

#CONFIG BROWSERSTACK WEB DICTIONARIES
&{win10ChromeDict}            
  ...                         dictTitle=win10Chrome
  ...                         os=Windows     
  ...                         os_version=10    
  ...                         browser=chrome   
  ...                         browser_version=98
&{win11ChromeDict}              
  ...                         dictTitle=win11Chrome
  ...                         os=Windows     
  ...                         os_version=11    
  ...                         browser=edge   
  ...                         browser_version=98
&{macCatalinaSafariDict}      
  ...                         dictTitle=macCatalinaSafari
  ...                         os=OS X     
  ...                         os_version=Catalina    
  ...                         browser=safari   
  ...                         browser_version=13.1
&{macMontereySafariDict}            
  ...                         dictTitle=macMontereySafari
  ...                         os=OS X     
  ...                         os_version=Monterey  
  ...                         browser=safari   
  ...                         browser_version=15.3

#TODO: Mobile configs are throwing errors from browserstack:   
#Setup failed:
#WebDriverException: Message: Command not supported.
&{googlePixel6ProChromeDict} 
  ...                         dictTitle=googlePixel6ProChrome
  ...                         browserName=android
  ...                         device=Google Pixel 6 Pro 
  ...                         os_version=12.0 
  ...                         realMobile=true
&{googlePixel4XLChromeDict}      
  ...                         dictTitle=googlePixel4XLChrome
  ...                         browserName=android
  ...                         device=Google Pixel 4 XL 
  ...                         os_version=10.0 
  ...                         realMobile=true
&{SamsungS20UltraChromeDict}    
  ...                         dictTitle=SamsungS20UltraChrome
  ...                         browserName=android
  ...                         device=Samsung Galaxy S20 Ultra 
  ...                         os_version=10.0 
  ...                         realMobile=true
&{iPhone13ProSafariDict}         
  ...                         dictTitle=iPhone13ProSafari
  ...                         browserName=iphone
  ...                         device=iPhone 13 Pro   
  ...                         os_version=15 
  ...                         realMobile=true
  ...                         browser=safari
&{iPhone12ProMaxSafariDict}  
  ...                         dictTitle=iPhone12ProMaxSafari
  ...                         browserName=iphone
  ...                         device=iPhone 12 Pro Max 
  ...                         os_version=14 
  ...                         realMobile=true
  ...                         browser=safari
&{iPhone11ProSafariDict}          
  ...                         dictTitle=iPhone11ProSafari
  ...                         browserName=iphone
  ...                         device=iPhone 11 Pro 
  ...                         os_version=15 
  ...                         realMobile=true
  ...                         browser=safari
&{iPhone8SafariDict}            
  ...                         dictTitle=iPhone8Safari
  ...                         browserName=iphone
  ...                         device=iPhone 8 
  ...                         os_version=13 
  ...                         realMobile=true
  ...                         browser=safari
&{iPhone13MiniSafariDict}
  ...                         dictTitle=iPhone13MiniSafari
  ...                         browserName=iphone
  ...                         device=iPhone 13 Mini 
  ...                         os_version=15 
  ...                         realMobile=true
  ...                         browser=safari

@{BS_DICT_LIST}
  ...                         ${win10ChromeDict}
  ...                         ${win11ChromeDict}
  ...                         ${macCatalinaSafariDict}
  ...                         ${macMontereySafariDict}
  ...                         ${googlePixel6ProChromeDict}
  ...                         ${googlePixel4XLChromeDict}
  ...                         ${SamsungS20UltraChromeDict}
  ...                         ${iPhone13ProSafariDict}
  ...                         ${iPhone12ProMaxSafariDict}
  ...                         ${iPhone11ProSafariDict}
  ...                         ${iPhone8SafariDict}
  ...                         ${iPhone13MiniSafariDict}

*** Keywords ***
#MARK APP AUTOMATE SESSION STATUS PASS/FAIL IN BROWSERSTACK
Mark App Automate Session Status Passed
    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}
    Close Application

Mark App Automate Session Status Failed
    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed"}}
    Close Application
    #This is the only available keyword to completely terminate further test suite execution
    BuiltIn.Fatal Error
  
#UPLOAD APPLICATION TO BROWSERSTACK CLOUD API
Upload iOS Application To Browserstack
# TODO: Instead of using the Run Process keyword, try API.Send POST Request
  [Arguments]              {envPath}
  &{authDict}=             Get BrowserStack ENV Variables   ${envPath}
  ${BS_APP_UPLOADER_iOS}=  Set Variable
  ...                      curl -u "${authDict.user}:${authDict.key}" 
  ...                      -X POST "https://${BS_APP_AUTOMATE_CLOUD_API}/upload" 
  ...                      -F "file=@${APP_FILE_iOS}" 
  ...                      -F "custom_id=${BS_CUSTOM_ID_iOS}"
  Run Process              ${BS_APP_UPLOADER_iOS}    shell=True   alias=UploadiOSApp
  Wait For Process         UploadiOSApp    timeout=30

Upload Android Application To Browserstack
  [Arguments]                  ${envPath}
  &{authDict}=                 Get BrowserStack ENV Variables   ${envPath}
  ${BS_APP_UPLOADER_ANDROID}=  Set Variable
  ...                          curl -u "${authDict.user}:${authDict.key}" 
  ...                          -X POST "https://${BS_APP_AUTOMATE_CLOUD_API}/upload" 
  ...                          -F "file=@${APP_FILE_ANDROID}" 
  ...                          -F "custom_id=${BS_CUSTOM_ID_ANDROID}"
  Run Process                  ${BS_APP_UPLOADER_ANDROID}    shell=True   alias=UploadAndroidApp
  Wait For Process             UploadAndroidApp    timeout=30

#iOS BROWSERSTACK LAUNCHER
Launch iOS Application On Browserstack Device
    [Arguments]              ${configBS}    ${envPath}
    &{authDict}=             Get BrowserStack ENV Variables   ${envPath}
    &{desiredCapabilities}=  Check Default Apps Desired Capabilities  
    ...                      ${configBS}
    ...                      ${BS_DEVICE_iOS}
    ...                      ${BS_OS_VERSION_iOS}
    Open Application         remote_url=http://${BS_REMOTE_URL}
    ...                      browserstack.user=${authDict.user} 
    ...                      browserstack.key=${authDict.key}
    ...                      app_url=${BS_CUSTOM_ID_iOS}
    ...                      device=${desiredCapabilities.device}
    ...                      os_version=${desiredCapabilities.os_version}
    ...                      project=${BS_PROJECT_iOS} 
    ...                      build=${BS_BUILD_iOS}
    ...                      name=${BS_NAME_iOS}
    ...                      browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

#ANDROID BROWSERSTACK LAUNCHER
Launch Android Application On Browserstack Device
    [Arguments]              ${configBS}  ${envPath}
    &{authDict}=             Get BrowserStack ENV Variables  ${envPath}
    &{desiredCapabilities}=  Check Default Apps Desired Capabilities  
    ...                      ${configBS}
    ...                      ${BS_DEVICE_ANDROID}
    ...                      ${BS_OS_VERSION_ANDROID}
    Open Application         remote_url=http://${BS_REMOTE_URL}
    ...                      browserstack.user=${authDict.user} 
    ...                      browserstack.key=${authDict.key}
    ...                      app_url=${BS_CUSTOM_ID_ANDROID}
    ...                      device=${desiredCapabilities.device}
    ...                      os_version=${desiredCapabilities.os_version}
    ...                      project=${BS_PROJECT_ANDROID}
    ...                      build=${BS_BUILD_ANDROID}
    ...                      name=${BS_NAME_ANDROID}
    ...                      browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

# WEB BROWSERSTACK LAUNCHER
Setup Browserstack For WEB
  [Arguments]                    ${urlForNavigation}  ${configBS}  ${envPath}
  &{authDict}=                   Get BrowserStack ENV Variables  ${envPath}
  ${remoteUrl}                   Set Variable                http://${authDict.user}:${authDict.key}@${BS_REMOTE_URL}
  &{desiredCapabilities}=        Set Desired Capabilities    ${configBS}
  ${desiredCapabilities.build}=  Set Variable                ${BS_BUILD_WEB}
  ${desiredCapabilities.name}=   Set Variable                ${TEST NAME}
  Open Browser                   ${urlForNavigation}
  ...                            remote_url=${remoteUrl}     
  ...                            desired_capabilities=${desiredCapabilities}
  Begin Maximize Browser Test

Set Desired Capabilities
  [Arguments]          ${configBS}
  FOR                  ${item}    IN    @{BS_DICT_LIST}
    IF                 '${configBS}' == '${item.dictTitle}'
      ${returnValue}=  Set Variable     ${item}
      Log              ${returnValue}
    END
  END  
  [Return]           ${returnValue}

Check Default Apps Desired Capabilities
  [Arguments]                  ${configBS}               ${configDevice}         ${configOS}
    IF                         '${configBS}' != 'win10Chrome'  
      &{desiredCapabilities}=  Set Desired Capabilities  ${configBS}
    ELSE 
      &{desiredCapabilities}=  Create Dictionary         device=${configDevice}  os_version=${configOS}            
    END
    [Return]                   ${desiredCapabilities}

Get BrowserStack ENV Variables
  [Arguments]           ${envPath}
  &{envVars}=           GetEnvVars.Retrieve_DotEnv    ${envPath}
  &{browserStackAuth}=  Create Dictionary
  ...                   user=${envVars.BS_USER}
  ...                   key=${envVars.BS_KEY}
  [Return]              &{browserStackAuth}
