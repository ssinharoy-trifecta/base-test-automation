*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${nutritionBtniOS}    xpath=//XCUIElementTypeButton[@name="Nutrition"]

#WEIGHT CARD
${addWeightNutritionBtniOS}    xpath=//XCUIElementTypeButton[@name="ADD"][1]
${keyboardDigit0BtniOS}    xpath=//XCUIElementTypeKey[@name="0"]
${keyboardDigit2BtniOS}    xpath=//XCUIElementTypeKey[@name="2"]
${keyboardDeleteBtniOS}    xpath=//XCUIElementTypeKey[@name="Delete"]
${addWeightCardBtniOS}    xpath=//XCUIElementTypeButton[@name="Add"]
${closeWeightCardBtn}    xpath=//XCUIElementTypeButton[@name="Close"]
${weightFieldCardField}    xpath=//XCUIElementTypeStaticText[@name="lbs"]




*** Keywords ***

Add Weight To The Weight Card
    Wait Until Element Is Visible    ${addWeightNutritionBtniOS}    timeout=10
    Click Element    ${addWeightNutritionBtniOS}
    Wait Until Page Contains Element    ${keyboardDeleteBtniOS}    timeout=10
    Click Element     ${keyboardDeleteBtniOS}
    Click Element     ${keyboardDeleteBtniOS}
    Click Element     ${keyboardDeleteBtniOS}
    Wait Until Element Is Visible    ${weightFieldCardField}    timeout=10
    Input Value        ${weightFieldCardField}    200
    Click Element    ${addWeightCardBtniOS}