*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${testUserEmail}       trifectatester2@gmail.com
${testUserPassword}    tester123

${getStartedBtn}    xpath=//XCUIElementTypeButton[@name="Get Started"]
${emailField}       xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeTextField
${passwordField}    xpath=//XCUIElementTypeOther[@name="AuthenticationViewController"]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeSecureTextField
${signInBtn}        xpath=//XCUIElementTypeButton[@name="Sign in"]

${allowBtn}    xpath=//XCUIElementTypeButton[@name="Allow"]


*** Keywords ***
