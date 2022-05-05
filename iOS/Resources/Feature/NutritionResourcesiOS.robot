*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${nutritionBtniOS}    xpath=//XCUIElementTypeButton[@name="Nutrition"]

#WEIGHT CARD
${addWeightNutritionBtniOS}    xpath=//XCUIElementTypeButton[@name="ADD"][1]
${keyboardDigit0BtniOS}        xpath=//XCUIElementTypeKey[@name="0"]
${keyboardDigit2BtniOS}        xpath=//XCUIElementTypeKey[@name="2"]
${keyboardDeleteBtniOS}        xpath=//XCUIElementTypeKey[@name="Delete"]
${addWeightCardBtniOS}         xpath=//XCUIElementTypeButton[@name="Add"]
${closeWeightCardBtniOS}       xpath=//XCUIElementTypeButton[@name="Close"]
${weightFieldCardFieldiOS}     xpath=//XCUIElementTypeStaticText[@name="lbs"]
${200lbsWeightCardLbliOS}      xpath=//XCUIElementTypeStaticText[@name="200 lb"][1]

#WATER CARD
${addWaterNutritionBtniOS}    xpath=//XCUIElementTypeButton[@name="ADD"][2]
${8ozWaterBtniOS}    xpath=//XCUIElementTypeButton[@name="+8 oz"]
${12ozWaterBtniOS}    xpath=//XCUIElementTypeButton[@name="+12 oz"]
${16ozWaterBtniOS}    xpath=//XCUIElementTypeButton[@name="+16 oz"]
${addWaterCardiOS}    xpath=//XCUIElementTypeStaticText[@name="Add"]



*** Keywords ***

Add Weight To The Weight Card iOS
    Wait Until Element Is Visible       ${addWeightNutritionBtniOS}    timeout=10
    Click Element                       ${addWeightNutritionBtniOS}
    Wait Until Page Contains Element    ${keyboardDeleteBtniOS}    timeout=10
    Repeat Keyword                      3 times    Click Element    ${keyboardDeleteBtniOS}
    Wait Until Element Is Visible       ${weightFieldCardFieldiOS}    timeout=10
    Input Value                         ${weightFieldCardFieldiOS}    200
    Click Element                       ${addWeightCardBtniOS}
    Wait Until Element Is Visible       ${200lbsWeightCardLbliOS}    timeout=10

Add Water To The Water Card
    Wait Until Element Is Visible       ${addWaterNutritionBtniOS}    timeout=10
    @{list}=    Create List    ${addWaterNutritionBtniOS}
    ...                        ${8ozWaterBtniOS}
    ...                        ${12ozWaterBtniOS}
    ...                        ${16ozWaterBtniOS}
    ...                        ${addWaterCardiOS}
    FOR    ${item}    IN    @{list}
        Click Element    ${item}
    END
