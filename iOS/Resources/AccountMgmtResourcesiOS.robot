*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${mainMenuBtn}    xpath=//XCUIElementTypeButton[@name="ic side menu"]
${logoutBtn}      xpath=//XCUIElementTypeButton[@name="Logout"]

*** Keywords ***

Log Out
    Wait Until Element Is Visible    ${mainMenuBtn}    timeout=30
    Click Element                    ${mainMenuBtn}
    Scroll Down                      ${logoutBtn}
    Click Element                    ${logoutBtn}