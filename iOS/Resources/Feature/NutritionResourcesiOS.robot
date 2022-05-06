*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

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
${8ozWaterBtniOS}             xpath=//XCUIElementTypeButton[@name="+8 oz"]
${12ozWaterBtniOS}            xpath=//XCUIElementTypeButton[@name="+12 oz"]
${16ozWaterBtniOS}            xpath=//XCUIElementTypeButton[@name="+16 oz"]
${addWaterCardiOS}            xpath=//XCUIElementTypeStaticText[@name="Add"]

#FOOD LOG
${nutritionBtniOS}                xpath=//XCUIElementTypeButton[@name="Nutrition"]
${breakfastBtniOS}                xpath=//XCUIElementTypeOther[@name="Breakfast"]
${lunchBtniOS}                    xpath=//XCUIElementTypeOther[@name="Lunch"]
${dinnerBtniOS}                   xpath=//XCUIElementTypeOther[@name="Dinner"]
${snacksBtniOS}                   xpath=//XCUIElementTypeOther[@name="Snacks"]
${foodSearchBariOS}               xpath=//XCUIElementTypeSearchField[@name="Search for food"]
${barCodeScannerBtniOS}           xpath=//XCUIElementTypeButton[@name="new scanner"]
${recentFoodBtniOS}               xpath=//XCUIElementTypeStaticText[@name="Recent"]
${myFoodBtniOS}                   xpath=//XCUIElementTypeStaticText[@name="My food"]
${myRecipesBtniOS}                xpath=//XCUIElementTypeStaticText[@name="My recipes"]
${addCustomFoodBtniOS}            xpath=//XCUIElementTypeStaticText[@name="Add"][2]
${addFirstFoodItemBtniOS}         xpath=//XCUIElementTypeButton[@name="new add"]
${doneAddingFoodBtniOS}           xpath=//XCUIElementTypeStaticText[@name="Done"]
${doneBtnNutritionKeyboardiOS}    xpath=//XCUIElementTypeButton[@name="Done"]
${foodItemAvocadoiOS}             xpath=//XCUIElementTypeStaticText[@name="Avocado"]
${foodItemPastaiOS}               xpath=//XCUIElementTypeStaticText[@name="Pasta"]
${foodItemPizzaiOS}               xpath=//XCUIElementTypeStaticText[@name="Pizza"]
${foodItemAppleiOS}               xpath=//XCUIElementTypeStaticText[@name="Apple"]


*** Keywords ***

Add Weight To The Weight Card iOS
    Wait Until Element Is Visible    ${addWeightNutritionBtniOS}    timeout=20
    Click Element                    ${addWeightNutritionBtniOS}
    Wait Until Element Is Visible    ${keyboardDeleteBtniOS}    timeout=20
    Repeat Keyword                   3 times    Click Element    ${keyboardDeleteBtniOS}
    Wait Until Element Is Visible    ${weightFieldCardFieldiOS}    timeout=20
    Input Value                      ${weightFieldCardFieldiOS}    200
    Click Element                    ${addWeightCardBtniOS}
    Wait Until Element Is Visible    ${200lbsWeightCardLbliOS}    timeout=20

Add Water To The Water Card iOS
    Wait Until Element Is Visible   ${addWaterNutritionBtniOS}    timeout=20
    @{list}=    Create List         ${addWaterNutritionBtniOS}
    ...                             ${8ozWaterBtniOS}
    ...                             ${12ozWaterBtniOS}
    ...                             ${16ozWaterBtniOS}
    ...                             ${addWaterCardiOS}
    FOR    ${item}    IN    @{list}
        Click Element    ${item}
    END

Log Food To Breakfast iOS
    Wait Until Element Is Visible   ${breakfastBtniOS}    timeout=20
    Click Element                   ${breakfastBtniOS}
    Wait Until Element Is Visible   ${foodSearchBariOS}    timeout=20
    Input Value                     ${foodSearchBariOS}    Avocado
    @{list}=    Create List         ${doneBtnNutritionKeyboardiOS}
    ...                             ${addFirstFoodItemBtniOS}
    ...                             ${doneAddingFoodBtniOS}
    FOR    ${item}    IN    @{list}
        Wait Until Element Is Visible    ${item}    timeout=20
        Click Element   ${item}
    END
    Wait Until Element Is Visible    ${foodItemAvocadoiOS}    timeout=20

Log Food To Lunch iOS
    Wait Until Element Is Visible    ${lunchBtniOS}    timeout=20
    Click Element                    ${lunchBtniOS}
    Input Value                      ${foodSearchBariOS}    Pasta
    @{list}=    Create List          ${doneBtnNutritionKeyboardiOS}
    ...                              ${addFirstFoodItemBtniOS}
    ...                              ${doneAddingFoodBtniOS}
    FOR    ${item}    IN    @{list}
        Wait Until Element Is Visible    ${item}    timeout=20
        Click Element    ${item}
    END
    Wait Until Element Is Visible    ${foodItemPastaiOS}    timeout=20

Log Food To Dinner iOS
    Wait Until Element Is Visible   ${breakfastBtniOS}    timeout=20
    Scroll                          ${lunchBtniOS}     ${breakfastBtniOS}
    Click Element                   ${dinnerBtniOS}
    Input Value                     ${foodSearchBariOS}    Pizza
    @{list}=    Create List         ${doneBtnNutritionKeyboardiOS}
    ...                             ${addFirstFoodItemBtniOS}
    ...                             ${doneAddingFoodBtniOS}
    FOR    ${item}    IN    @{list}
        Wait Until Element Is Visible    ${item}    timeout=20
        Click Element   ${item}
    END
    Wait Until Element Is Visible   ${foodItemPizzaiOS}    timeout=20

Log Food To Snacks iOS
    Wait Until Element Is Visible    ${breakfastBtniOS}    timeout=20
    Scroll                           ${lunchBtniOS}     ${breakfastBtniOS}
    Scroll                           ${dinnerBtniOS}     ${lunchBtniOS}
    Click Element                    ${snacksBtniOS}
    Input Value                      ${foodSearchBariOS}    Apple
    @{list}=    Create List          ${doneBtnNutritionKeyboardiOS}
    ...                              ${addFirstFoodItemBtniOS}
    ...                              ${doneAddingFoodBtniOS}
    FOR                              ${item}    IN    @{list}
        Wait Until Element Is Visible    ${item}    timeout=20
        Click Element   ${item}
    END
    Wait Until Element Is Visible    ${foodItemAppleiOS}    timeout=20
