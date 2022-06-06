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
${editFoodLogBtniOS}              xpath=//XCUIElementTypeButton[@name="Edit"]
${selectFoodItemBtniOS}           xpath=//XCUIElementTypeImage[@name="circle"]
${addCustomFoodTxtiOS}            xpath=//XCUIElementTypeStaticText[@name="Add Custom Food"]
${customFoodFieldPrefixiOS}       xpath=//XCUIElementTypeApplication[@name="TriDebug"]
...                               /XCUIElementTypeWindow/XCUIElementTypeOther[2]
...                               /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                               /XCUIElementTypeOther/XCUIElementTypeOther[2]
...                               /XCUIElementTypeTable/XCUIElementTypeCell[
${customFoodFieldSuffixiOS}       ]/XCUIElementTypeTextField
${customFoodNameFieldiOS}         ${customFoodFieldPrefixiOS}1${customFoodFieldSuffixiOS} 
${customFoodBrandFieldiOS}        ${customFoodFieldPrefixiOS}2${customFoodFieldSuffixiOS} 
${customFoodServingSizeFieldiOS}  ${customFoodFieldPrefixiOS}3${customFoodFieldSuffixiOS} 
${customFoodCaloriesFieldiOS}     ${customFoodFieldPrefixiOS}5${customFoodFieldSuffixiOS} 
${addToBreakfastBtniOS}           xpath=//XCUIElementTypeButton[@name="Add to breakfast"]

*** Keywords ***

Add Weight To The Weight Card iOS
    [Arguments]                                             ${userWeight}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightNutritionBtniOS}
    Wait Until Element Is Visible                           ${keyboardDeleteBtniOS}
    Repeat Keyword                                          3 times    Click Element    ${keyboardDeleteBtniOS}
    Wait Until Element Is Visible                           ${weightFieldCardFieldiOS}
    Input Value                                             ${weightFieldCardFieldiOS}    ${userWeight}
    Click Element                                           ${addWeightCardBtniOS}
    Wait Until Element Is Visible                           ${200lbsWeightCardLbliOS}

Add Water To The Water Card iOS
    Wait Until Element Is Visible   ${addWaterNutritionBtniOS}
    @{list}=    Create List         ${addWaterNutritionBtniOS}
    ...                             ${8ozWaterBtniOS}
    ...                             ${12ozWaterBtniOS}
    ...                             ${16ozWaterBtniOS}
    ...                             ${addWaterCardiOS}
    FOR                             ${item}    IN    @{list}
        Click Element               ${item}
    END

Log Food iOS
    [Arguments]                                                ${mealButton}    ${foodItem}
    CommonApps.Wait Until Visible And Click Element Apps       ${mealButton}
    Wait Until Element Is Visible                              ${foodSearchBariOS}
    Input Value                                                ${foodSearchBariOS}    ${foodItem}
    @{list}=    Create List                                    ${doneBtnNutritionKeyboardiOS}
    ...                                                        ${addFirstFoodItemBtniOS}
    ...                                                        ${doneAddingFoodBtniOS}
    FOR                                                        ${item}    IN    @{list}
        CommonApps.Wait Until Visible And Click Element Apps   ${item}
    END
    Wait Until Page Contains                                   ${foodItem}

Add Custom Food iOS
    [Arguments]                                             ${foodName}    ${brandName}    ${servingSize}    ${calories}
    CommonApps.Wait Until Visible And Click Element Apps    ${breakfastBtniOS}
    CommonApps.Wait Until Visible And Click Element Apps    ${addCustomFoodTxtiOS}
    Wait Until Element Is Visible                           ${customFoodNameFieldiOS}
    Input Value                                             ${customFoodNameFieldiOS}    ${foodName}
    Wait Until Element Is Visible                           ${customFoodBrandFieldiOS}
    Input Value                                             ${customFoodBrandFieldiOS}    ${brandName}
    Wait Until Element Is Visible                           ${customFoodServingSizeFieldiOS}
    Input Value                                             ${customFoodServingSizeFieldiOS}    ${servingSize}
    Wait Until Element Is Visible                           ${customFoodCaloriesFieldiOS}
    Input Value                                             ${customFoodCaloriesFieldiOS}    ${calories}
    Click Text                                              Done   exact_match=True
    CommonApps.Wait Until Visible And Click Element Apps    ${addToBreakfastBtniOS}
    Wait Until Page Contains                                ${foodName}
