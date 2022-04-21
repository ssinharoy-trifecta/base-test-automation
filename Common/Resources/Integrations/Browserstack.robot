*** Variables ***
#Common
${BS_REMOTE_URL}     hub-cloud.browserstack.com/wd/hub
${BS_USER}           tylerthomas6    
${BS_KEY}            FQtVoY5xMMxVa9bh1c1Z
${BS_IDLE_TIMEOUT}   5

#iOS
${BS_APP_iOS}           bs://ad573e42e2267683263e4c925668c8d5bbb3bb0d
${BS_PROJECT_iOS}       iOS System Smoke Test
${BS_BUILD_iOS}         iOS
${BS_NAME_iOS}          iOS_System_Smoke_Test
${BS_DEVICE_iOS}        iPhone 13
${BS_OS_VERSION_iOS}    15

#Android
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
${BS_PROJECT_WEB}       Web Test
${BS_NAME_WEB}          Web_Test
${BS_BUILD_WEB}         Web

*** Keywords ***

#MARK APP AUTOMATE SESSION STATUS PASS/FAIL IN BROWSERSTACK
Mark App Automate Session Status Browserstack
    Run Keyword If All Tests Passed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}
    Run Keyword If Any Tests Failed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed"}}
    Close All Applications

# iOS BROWSERSTACK LAUNCHER
Launch Application iOS
    Open Application    remote_url=http://${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app=${BS_APP_iOS}
    ...                 device=${BS_DEVICE_iOS}
    ...                 os_version=${BS_OS_VERSION_iOS}
    ...                 project=${BS_PROJECT_iOS} 
    ...                 build=${BS_BUILD_iOS}
    ...                 name=${BS_NAME_iOS}
    ...                 browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}

# ANDROID BROWSERSTACK LAUNCHER
Launch Application Android
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
