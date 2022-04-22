*** Variables ***
#COMMON
${BS_REMOTE_URL}     http://hub-cloud.browserstack.com/wd/hub
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

*** Keywords ***

#MARK APP AUTOMATE SESSION STATUS PASS/FAIL IN BROWSERSTACK
Mark App Automate Session Status Browserstack
    Run Keyword If All Tests Passed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}
    Run Keyword If Any Tests Failed
    ...    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed"}}
    Close All Applications

# iOS BROWSERSTACK LAUNCHER
Launch iOS Application On Browserstack
    Open Application    remote_url=${BS_REMOTE_URL}
    ...                 browserstack.user=${BS_USER} 
    ...                 browserstack.key=${BS_KEY}
    ...                 app=${BS_APP_iOS}
    ...                 device=${BS_DEVICE_iOS}
    ...                 os_version=${BS_OS_VERSION_iOS}
    ...                 project=${BS_PROJECT_iOS} 
    ...                 build=${BS_BUILD_iOS}
    ...                 name=${BS_NAME_iOS}
    ...                 browserstack.idle.Timeout=${BS_IDLE_TIMEOUT}