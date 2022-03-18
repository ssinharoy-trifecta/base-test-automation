*** Settings ***

Library    AppiumLibrary

*** Variables ***

#Text Variables

${TESTUSER1_DETAILS}     trifectatester2@gmail.com
${TESTUSER1_PASSWORD}    tester123

#Warnings

${allowBtn}    xpath=//XCUIElementTypeButton[@name="Allow"]

#Authentication

${getStartedBtn}    xpath=//XCUIElementTypeButton[@name="Get Started"]
${emailField}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordField}    xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtn}        xpath=//XCUIElementTypeButton[@name="Sign in"]

#Onboarding

#Main Menu

${mainMenuBtn}    xpath=//XCUIElementTypeButton[@name="ic side menu"]
${logoutBtn}      xpath=//XCUIElementTypeButton[@name="Logout"]

#Nutrition

${nutritionBtn}    xpath=//XCUIElementTypeButton[@name="Nutrition"]

#Fitness

${fitnessBtn}   xpath=//XCUIElementTypeButton[@name="Fitness"]

#WebView Shop

${shopBtn}                  xpath=//XCUIElementTypeButton[@name="Shop"]
${shopCloseBtn}             xpath=//XCUIElementTypeButton[@name="ic sideMenu close"]
${shopBackBtn}              xpath=//XCUIElementTypeButton[@name="ic sideMenu back"]
${currentSubscriptionTxt}   xpath=//XCUIElementTypeOther[@name="Current Subscription"]
${nextDeliveryTxt}          xpath=//XCUIElementTypeStaticText[@name="Next Delivery"]
${faqTxt}                   xpath=//XCUIElementTypeStaticText[@name="Frequently Asked Questions"]
${subscriptionDetailsTxt}   xpath=//XCUIElementTypeStaticText[@name="Subscription Details"]
${modifyBtn}                xpath=//XCUIElementTypeButton[@name="Modify"]