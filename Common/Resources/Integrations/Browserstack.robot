*** Settings ***

#Resource    ../../../iOS/Resources/System/Trifecta

*** Variables ***
#COMMON
${BS_REMOTE_URL}     hub-cloud.browserstack.com/wd/hub
${BS_USER}           tylerthomas6    
${BS_KEY}            FQtVoY5xMMxVa9bh1c1Z
${BS_IDLE_TIMEOUT}   5

#iOS
${BS_APP_iOS}           bs://55aeeb779b120b50c4fec2bf2b334a3f26a5bb56
${BS_PROJECT_iOS}       iOS System Smoke Test
${BS_BUILD_iOS}         iOS
${BS_NAME_iOS}          iOS_System_Smoke_Test
${BS_DEVICE_iOS}        iPhone 13
${BS_OS_VERSION_iOS}    15

#ANDROID
${BS_APP_ANDROID}           bs://a4d0becc184bdf02f991641ed71600aabbb2f8fa
${BS_PROJECT_ANDROID}       Android System Smoke Test
${BS_BUILD_ANDROID}         Android
${BS_NAME_ANDROID}          Android_System_Smoke_Test
${BS_DEVICE_ANDROID}        Google Pixel 3
${BS_OS_VERSION_ANDROID}    9.0

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

Upload iOS Application To Browserstack


#iOS BROWSERSTACK LAUNCHER
Launch iOS Application On Browserstack
    Open Application    remote_url=http://${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app_url=${BS_APP_iOS}
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
    ...                 app=${BS_APP_ANDROID}
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
