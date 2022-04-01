*** Settings ***


Library    AppiumLibrary
Library    BuiltIn
Resource   ../Resources/Mobile/iOSElements.robot


*** Test Cases ***

Test Launch Trifecta Application
    #LAUNCH THE APP ON BROWSERSTACK EMULATOR
    Open Application    remote_url=http://hub-cloud.browserstack.com/wd/hub
    ...                 browserstack.user=tylerthomas6    
    ...                 browserstack.key=FQtVoY5xMMxVa9bh1c1Z
    ...                 app=bs://362fd79ea6457c0bbd9feb481bfe4ec65dbbc2d7
    ...                 device=iPhone 13
    ...                 os_version=15
    ...                 project=iOS Test Run
    ...                 build=browserstack-build-1  
    ...                 name=iOS_Test_Run
    ...                 browserstack.idleTimeout=5

    # LAUNCH THE APP ON XCODE EMULATOR
    # Open Application    http://localhost:4723/wd/hub
    # ...                 platformName=iOS
    # ...                 platformVersion=15
    # ...                 udid=7DDC7B2F-C731-4B3F-8D90-F698CECBAE2D
    # ...                 bundleId=com.dmw.iCrossFit
    # ...                 deviceName=iPhone 13 mini
    # ...                 automationName=XCUITest

#THIS WILL CHECK IF IOS NATIVE ALERT EXISTS AND CLICK ON 'ALLOW' BUTTON IF IT DOES
Test Check for Data Alert
    Sleep                    3
    ${alert}                 Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtn}    timeout=10
    Run Keyword If           '${alert}' == 'False'    Click Element    ${allowBtn}

Test Sign In With Existing User
    Wait Until Element Is Visible    ${getStartedBtn}    timeout=30
    Click Element                    ${getStartedBtn}
    Wait Until Element Is Visible    ${emailField}    timeout=30
    Input Text                       ${emailField}    ${testUserEmail}
    Input Text                       ${passwordField}    ${testUserPassword}
    Click Element                    ${signInBtn}

#THIS WILL CHECK IF IOS NATIVE ALERT EXISTS AND CLICK ON 'ALLOW' BUTTON IF IT DOES
Test Check For Notifications Alert
    Sleep                    3
    ${alert2}                Run Keyword And Return Status    Page Should Not Contain Element    ${allowBtn}    timeout=10
    Run Keyword If           '${alert2}' == 'False'    Click Element    ${allowBtn}

Test Shop Dashboard UI
    Wait Until Element Is Visible        ${shopBtn}    timeout=30
    Click Element                        ${shopBtn}
    Wait Until Page Contains Element     ${currentSubscriptionTxt}    timeout=30
    Page Should Contain Element          ${currentSubscriptionTxt}
    Wait Until Page Contains Element     ${nextDeliveryTxt}    timeout=30
    Page Should Contain Element          ${nextDeliveryTxt}
    Wait Until Page Contains Element     ${faqTxt}    timeout=30
    Page Should Contain Element          ${faqTxt}
    Wait Until Page Contains Element     ${subscriptionDetailsTxt}    timeout=30
    Page Should Contain Element          ${subscriptionDetailsTxt}
    Wait Until Element Is Visible        ${shopCloseBtn}
    Click Element                        ${shopCloseBtn}

Test Log Out Using Logout Button
    Wait Until Element Is Visible    ${mainMenuBtn}    timeout=30
    Click Element                    ${mainMenuBtn}
    Scroll Down                      ${logoutBtn}
    Click Element                    ${logoutBtn}
