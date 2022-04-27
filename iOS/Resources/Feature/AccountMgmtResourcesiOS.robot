*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${mainMenuBtniOS}    xpath=//XCUIElementTypeButton[@name="ic side menu"]
${logoutBtniOS}      xpath=//XCUIElementTypeButton[@name="Logout"]

*** Keywords ***

Log Out iOS
    Wait Until Element Is Visible    ${mainMenuBtniOS}    timeout=30
    Click Element                    ${mainMenuBtniOS}
    Scroll Down                      ${logoutBtniOS}
    Click Element                    ${logoutBtniOS}
