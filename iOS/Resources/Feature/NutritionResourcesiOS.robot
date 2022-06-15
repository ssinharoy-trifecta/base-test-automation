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

#NUTRITION ANALYTICS
${nutritionAnalyticsTopBtniOS}              xpath=//XCUIElementTypeButton[@name="ic analytics navigation bar"]
${backBtnAnalyticsiOS}                      xpath=//XCUIElementTypeNavigationBar[@name="Nutrition Analytics"]/XCUIElementTypeButton
${myDayBtnAnalyticsiOS}                     xpath=//XCUIElementTypeButton[@name="My Day"]
${caloriesBtnAnalyticsiOS}                  xpath=//XCUIElementTypeButton[@name="Calories"]
${nutrientsBtnAnalyticsiOS}                 xpath=//XCUIElementTypeButton[@name="Nutrients"]
${weightBtnAnalyticsiOS}                    xpath=//XCUIElementTypeButton[@name="Weight"]
${pieChartFourEvementsAnalyticsiOS}         xpath=//XCUIElementTypeOther[@name="Calories. 4 Elements"]
${breakfastLabelAnalyticsiOS}               xpath=//XCUIElementTypeStaticText[@name="BREAKFAST"]
${lunchLabelAnalyticsiOS}                   xpath=//XCUIElementTypeStaticText[@name="LUNCH"]
${dinnerLabelAnalyticsiOS}                  xpath=//XCUIElementTypeStaticText[@name="DINNER"]
${snaksLabelAnalyticsiOS}                   xpath=//XCUIElementTypeStaticText[@name="SNACKS"]
${dailyCalorieGoalTxtAnalyticsiOS}          xpath=//XCUIElementTypeStaticText[@name="Daily Calorie Goal"]
${consumedCaloriesTxtAnalyticsiOS}          xpath=//XCUIElementTypeStaticText[@name="Consumed Calories"]
${macrosSummaryTxtAnalyticsiOS}             xpath=//XCUIElementTypeStaticText[@name="Macros Summary"]
${dailyPickerAnalyticsiOS}                  xpath=//XCUIElementTypeButton[@name="Daily"]
${datePickerAnalyticsiOS}                   xpath=//XCUIElementTypeButton[@name="Today"]
${weeklyBtnAnalyticsiOS}                    xpath=//XCUIElementTypeButton[@name="Weekly"]
${barChartAnalyticsCaloriesAnalyticsiOS}    xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                                         /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                         /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                         /XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther
...                                         /XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]
${dailyAverageTxtAnalyticsiOS}              xpath=//XCUIElementTypeStaticText[@name="Daily Average"]
${averageDailyCaloriesTxtiOS}               xpath=//XCUIElementTypeStaticText[@name="Average daily calories"]
${highestInCaloriesTxtAnalyticsiOS}         xpath=//XCUIElementTypeStaticText[@name="Highest In Calories:"]
${lowestInCaloriesTxtAnalyticsiOS}          xpath=//XCUIElementTypeStaticText[@name="Lowest In Calories:"]
${nutrientSummaryAnalyticsiOS}              xpath=//XCUIElementTypeStaticText[@name="Nutrient Summary"]
${proteinLabelAnalytics}                    xpath=//XCUIElementTypeStaticText[@name="PROTEIN"]
${fatLabelAnalytics}                        xpath=//XCUIElementTypeStaticText[@name="FAT"]
${carbsLabelAnalytics}                      xpath=//XCUIElementTypeStaticText[@name="CARBS"]
${nutrientDailyAverageTxtAnalyticsiOS}      xpath=//XCUIElementTypeStaticText[@name="Nutrient Daily Average"]
${weightRangePickerAnalyticsiOS}            xpath=//XCUIElementTypeButton[@name="1 Week"]
${weightGraphAnalyticsiOS}                  xpath=//XCUIElementTypeOther[@name="Line Chart. 1 dataset. DataSet 1"]
${weightLogTxtAnalyticsiOS}                 xpath=//XCUIElementTypeStaticText[@name="Weight Log"]
${addWeightBtnAnalyticsiOS}                 xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                                         /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                         /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                         /XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeButton

#NUTRITION GOALS
${nutritionGoalsBtniOS}                     xpath=//XCUIElementTypeButton[@name="macro override"]
${nutritionGoalsTxtiOS}                     xpath=//XCUIElementTypeStaticText[@name="Nutrition Goals"]
${closeNutritionGoalsiOS}                   xpath=//XCUIElementTypeButton[@name="Close"]
${proteinTxtNutritionGoalsiOS}              xpath=//XCUIElementTypeStaticText[@name="Protein (g)"]
${fatTxtNutritionGoalsiOS}                  xpath=//XCUIElementTypeStaticText[@name="Fat (g)"]
${carbsTxtNutritionGoalsiOS}                xpath=//XCUIElementTypeStaticText[@name="Carbs (g)"]
${caloriesTxtNutritionGoalsiOS}             xpath=//XCUIElementTypeStaticText[@name="Calories"]
${useRecommendedValBtnNutritionGoalsiOS}    xpath=//XCUIElementTypeButton[@name="Use recommended values"]
${updateNutritionGoalsBtniOS}               xpath=//XCUIElementTypeButton[@name="Update"]
${caloriesFieldNutritionGoalsiOS}           xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[5]/XCUIElementTypeTextField
${twoBtnKeyboardiOS}                        xpath=//XCUIElementTypeKey[@name="2"]
${zeroBtnKeyboardiOS}                       xpath=//XCUIElementTypeKey[@name="0"]
${deleteBtnKeyboardiOS}                     xpath=//XCUIElementTypeKey[@name="Delete"]

*** Keywords ***

Add Weight To The Weight Card iOS
    [Arguments]                                             ${userWeight}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightNutritionBtniOS}
    Wait Until Element Is Visible                           ${keyboardDeleteBtniOS}
    Repeat Keyword                                          3 times    Click Element    ${keyboardDeleteBtniOS}
    Wait Until Element Is Visible                           ${weightFieldCardFieldiOS}
    Input Value                                             ${weightFieldCardFieldiOS}    ${userWeight}
    Capture Page Screenshot
    Click Element                                           ${addWeightCardBtniOS}
    Wait Until Element Is Visible                           ${200lbsWeightCardLbliOS}

Add Water To The Water Card iOS
    Wait Until Element Is Visible   ${addWaterNutritionBtniOS}
    @{list}=    Create List         ${addWaterNutritionBtniOS}
    ...                             ${8ozWaterBtniOS}
    ...                             ${12ozWaterBtniOS}
    ...                             ${16ozWaterBtniOS}
    FOR                             ${item}    IN    @{list}
        Click Element               ${item}
    END
    Capture Page Screenshot
    Click Element                   ${addWaterCardiOS}

#FOOD LOG
Log Food iOS
    [Arguments]                                                ${mealButton}    ${foodItem}
    CommonApps.Wait Until Visible And Click Element Apps       ${mealButton}
    Wait Until Element Is Visible                              ${foodSearchBariOS}
    Input Value                                                ${foodSearchBariOS}    ${foodItem}
    Capture Page Screenshot
    @{list}=    Create List                                    ${doneBtnNutritionKeyboardiOS}
    ...                                                        ${addFirstFoodItemBtniOS}
    ...                                                        ${doneAddingFoodBtniOS}
    FOR                                                        ${item}    IN    @{list}
        CommonApps.Wait Until Visible And Click Element Apps   ${item}
    END
    Wait Until Page Contains                                   ${foodItem}
    Capture Page Screenshot

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
    Capture Page Screenshot
    Click Text                                              Done   exact_match=True
    CommonApps.Wait Until Visible And Click Element Apps    ${addToBreakfastBtniOS}
    Wait Until Page Contains                                ${foodName}
    Capture Page Screenshot

#NUTRITION ANALYTICS
Open Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionAnalyticsTopBtniOS}

Close Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${backBtnAnalyticsiOS}

Review My Day UI - Food Logged iOS
    Open Nutrition Analytics iOS
    Wait Until Element Is Visible    ${pieChartFourEvementsAnalyticsiOS}
    @{list}=    Create List          ${breakfastLabelAnalyticsiOS}
    ...                              ${lunchLabelAnalyticsiOS}
    ...                              ${dinnerLabelAnalyticsiOS}
    ...                              ${snaksLabelAnalyticsiOS}
    ...                              ${dailyCalorieGoalTxtAnalyticsiOS}
    ...                              ${consumedCaloriesTxtAnalyticsiOS}
    ...                              ${macrosSummaryTxtAnalyticsiOS}
    FOR                              ${item}    IN    @{list}
        Element Should Be Visible    ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Review Calories Daily UI - Food Logged iOS
    Open Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${caloriesBtnAnalyticsiOS}
    Wait Until Element Is Visible                           ${pieChartFourEvementsAnalyticsiOS}
    @{list}=    Create List                                 ${breakfastLabelAnalyticsiOS}
    ...                                                     ${lunchLabelAnalyticsiOS}
    ...                                                     ${dinnerLabelAnalyticsiOS}
    ...                                                     ${snaksLabelAnalyticsiOS}
    ...                                                     ${dailyCalorieGoalTxtAnalyticsiOS}
    ...                                                     ${consumedCaloriesTxtAnalyticsiOS}
    ...                                                     ${highestInCaloriesTxtAnalyticsiOS}
    ...                                                     ${lowestInCaloriesTxtAnalyticsiOS}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Review Calories Weekly UI - Food Logged iOS
    Open Nutrition Analytics iOS
    @{list}=    Create List                                     ${caloriesBtnAnalyticsiOS}
    ...                                                         ${dailyPickerAnalyticsiOS}
    ...                                                         ${weeklyBtnAnalyticsiOS}
    FOR                                                         ${item}    IN    @{list}
        CommonApps.Wait Until Visible And Click Element Apps    ${item}
    END
    Wait Until Element Is Visible                               ${dailyAverageTxtAnalyticsiOS}
    @{list}=    Create List                                     ${breakfastLabelAnalyticsiOS}
    ...                                                         ${barChartAnalyticsCaloriesAnalyticsiOS}
    ...                                                         ${lunchLabelAnalyticsiOS}
    ...                                                         ${dinnerLabelAnalyticsiOS}
    ...                                                         ${snaksLabelAnalyticsiOS}
    ...                                                         ${averageDailyCaloriesTxtiOS}
    ...                                                         ${highestInCaloriesTxtAnalyticsiOS}
    ...                                                         ${lowestInCaloriesTxtAnalyticsiOS}
    FOR                                                         ${item}    IN    @{list}
        Element Should Be Visible                               ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Review Nutrients Daily UI - Food Logged iOS
    Open Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${nutrientsBtnAnalyticsiOS}
    Wait Until Element Is Visible                           ${macrosSummaryTxtAnalyticsiOS}
    @{list}=    Create List                                 ${proteinLabelAnalytics}
    ...                                                     ${carbsLabelAnalytics}
    ...                                                     ${fatLabelAnalytics}
    ...                                                     ${nutrientSummaryAnalyticsiOS}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Review Nutrients Weekly UI - Food Logged iOS
    Open Nutrition Analytics iOS
    @{list}=    Create List                                     ${nutrientsBtnAnalyticsiOS}
    ...                                                         ${dailyPickerAnalyticsiOS}
    ...                                                         ${weeklyBtnAnalyticsiOS}
    FOR                                                         ${item}    IN    @{list}
        CommonApps.Wait Until Visible And Click Element Apps    ${item}
    END
    Wait Until Element Is Visible                               ${barChartAnalyticsCaloriesAnalyticsiOS}
    @{list}=    Create List                                     ${proteinLabelAnalytics}
    ...                                                         ${carbsLabelAnalytics}
    ...                                                         ${fatLabelAnalytics}
    ...                                                         ${nutrientDailyAverageTxtAnalyticsiOS}
    FOR                                                         ${item}    IN    @{list}
        Element Should Be Visible                               ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Review Weight UI - Weight Logged iOS
    Open Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${weightBtnAnalyticsiOS}
    Wait Until Element Is Visible                           ${weightGraphAnalyticsiOS}
    @{list}=    Create List                                 ${weightRangePickerAnalyticsiOS}
    ...                                                     ${weightLogTxtAnalyticsiOS}
    ...                                                     ${addWeightBtnAnalyticsiOS}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}    timeout=10
    END
    Capture Page Screenshot
    Close Nutrition Analytics iOS

Add New Weight To The Weight Log iOS
    [Arguments]                                             ${userWeight}
    Open Nutrition Analytics iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${weightBtnAnalyticsiOS}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightBtnAnalyticsiOS}
    Wait Until Element Is Visible                           ${weightFieldCardFieldiOS}
    Input Value                                             ${weightFieldCardFieldiOS}    ${userWeight}
    Capture Page Screenshot
    Click Element                                           ${addWeightCardBtniOS}
    Page Should Contain Text                                180
    Capture Page Screenshot
    Close Nutrition Analytics iOS

#NUTRITION GOALS
Review Nutrition Goals UI iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtniOS}
    Wait Until Element Is Visible                           ${nutritionGoalsTxtiOS}
    @{list}=    Create List                                 ${closeNutritionGoalsiOS}
    ...                                                     ${proteinTxtNutritionGoalsiOS}
    ...                                                     ${fatTxtNutritionGoalsiOS}
    ...                                                     ${carbsTxtNutritionGoalsiOS}
    ...                                                     ${caloriesTxtNutritionGoalsiOS}
    ...                                                     ${useRecommendedValBtnNutritionGoalsiOS}
    ...                                                     ${updateNutritionGoalsBtniOS}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Click Element                                            ${closeNutritionGoalsiOS}

Update Nutrition Goals For Non-Premium Users iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtniOS}
    Wait Until Element Is Visible                           ${nutritionGoalsTxtiOS}
    Clear Text                                              ${caloriesFieldNutritionGoalsiOS}
    Input Value                                             ${caloriesFieldNutritionGoalsiOS}   2000
    Capture Page Screenshot
    Click Element                                           ${updateNutritionGoalsBtniOS}
    Page Should Contain Text                                2,000

Use Recommended Values For Non-Premium Users iOS
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtniOS}
    CommonApps.Wait Until Visible And Click Element Apps    ${useRecommendedValBtnNutritionGoalsiOS}
    Page Should Contain Text                                2,132
