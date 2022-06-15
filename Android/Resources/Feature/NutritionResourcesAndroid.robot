*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#WEIGHT CARD
${addWeightNutritionBtnAndroid}    id=com.n_ix.pocket_wod:id/weight_text_view
${addWeightCardBtnAndroid}         id=com.n_ix.pocket_wod:id/addBtn
${closeWeightCardBtnAndroid}       id=com.n_ix.pocket_wod:id/closeBtn
${weightFieldCardAndroid}          id=com.n_ix.pocket_wod:id/weightView
${addWeightFieldAndroid}           id=com.n_ix.pocket_wod:id/first_value_edit_text
${setWeightBtnAndroid}             id=com.n_ix.pocket_wod:id/set_button

#WATER CARD
${addWaterNutritionBtnAndroid}    id=com.n_ix.pocket_wod:id/water_consumption_text_view
${8ozWaterBtnAndroid}             id=com.n_ix.pocket_wod:id/add8ozBtn
${12ozWaterBtnAndroid}            id=com.n_ix.pocket_wod:id/add12ozBtn
${16ozWaterBtnAndroid}            id=com.n_ix.pocket_wod:id/add16ozBtn
${addWaterCardBtnAndroid}         id=com.n_ix.pocket_wod:id/addBtn

#FOOD LOG
${nutritionBtnAndroid}                id=com.n_ix.pocket_wod:id/nutrition
${mealBtnPrefixAndroid}               xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout
...                                   /android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout
...                                   /androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout
...                                   /android.view.ViewGroup/androidx.viewpager.widget.ViewPager
...                                   /androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout
...                                   /android.widget.FrameLayout/android.widget.LinearLayout
...                                   /androidx.viewpager.widget.ViewPager/android.widget.FrameLayout
...                                   /android.widget.LinearLayout/android.widget.FrameLayout[2]
...                                   /androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[
${mealBtnSuffixAndroid}               ]/android.widget.FrameLayout
${breakfastBtnAndroid}                ${mealBtnPrefixAndroid}1${mealBtnSuffixAndroid} 
${lunchBtnAndroid}                    ${mealBtnPrefixAndroid}2${mealBtnSuffixAndroid} 
${dinnerBtnAndroid}                   ${mealBtnPrefixAndroid}3${mealBtnSuffixAndroid} 
${snacksBtnAndroid}                   ${mealBtnPrefixAndroid}4${mealBtnSuffixAndroid} 
${foodSearchBarAndroid}               id=com.n_ix.pocket_wod:id/searchFoodView
${barCodeScannerBtnAndroid}           id=com.n_ix.pocket_wod:id/runScan
${recentFoodBtnAndroid}               xpath=//android.widget.LinearLayout[@content-desc="Recent"]/android.widget.TextView
${myFoodBtnAndroid}                   xpath=//android.widget.LinearLayout[@content-desc="My food"]/android.widget.TextView
${myRecipesBtnAndroid}                xpath=//android.widget.LinearLayout[@content-desc="My recipes"]/android.widget.TextView
${addCustomFoodBtnAndroid}            id=com.n_ix.pocket_wod:id/add_button
${addFirstFoodItemBtnAndroid}         id=com.n_ix.pocket_wod:id/plusBtn
${doneAddingFoodBtnAndroid}           id=com.n_ix.pocket_wod:id/doneButton
${editFoodLogBtnAndroid}              xpath=com.n_ix.pocket_wod:id/edit_text_view
${selectFoodItemBtnAndroid}           xpath=com.n_ix.pocket_wod:id/selectionCheckbox
${customFoodNameFieldAndroid}         id=com.n_ix.pocket_wod:id/name_input
${customFoodBrandFieldAndroid}        id=com.n_ix.pocket_wod:id/brand_input
${customFoodServingSizeFieldAndroid}  id=com.n_ix.pocket_wod:id/serving_size_input
${customFoodCaloriesFieldAndroid}     id=com.n_ix.pocket_wod:id/calories_input
${addToBreakfastBtnAndroid}           id=com.n_ix.pocket_wod:id/add_button

#NUTRITION ANALYTICS
${nutritionAnalyticsTopBtnAndroid}              id=com.n_ix.pocket_wod:id/analyticsButtonTop
${backBtnAnalyticsAndroid}                      xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${myDayBtnAnalyticsAndroid}                     xpath=//android.widget.LinearLayout[@content-desc="My Day"]
${caloriesBtnAnalyticsAndroid}                  xpath=//android.widget.LinearLayout[@content-desc="Calories"]
${nutrientsBtnAnalyticsAndroid}                 xpath=//android.widget.LinearLayout[@content-desc="Nutrients"]
${weightBtnAnalyticsAndroid}                    xpath=//android.widget.LinearLayout[@content-desc="Weight"]
${pieChartFourEvementsAnalyticsAndroid}         id=com.n_ix.pocket_wod:id/pieChart
${breakfastLabelAnalyticsAndroid}               id=com.n_ix.pocket_wod:id/breakfastCalories
${lunchLabelAnalyticsAndroid}                   id=com.n_ix.pocket_wod:id/lunchCalories
${dinnerLabelAnalyticsAndroid}                  id=com.n_ix.pocket_wod:id/dinnerCalories
${snaksLabelAnalyticsAndroid}                   id=com.n_ix.pocket_wod:id/snacksCalories
${dailyCalorieGoalTxtAnalyticsAndroid}          id=com.n_ix.pocket_wod:id/dailyGoalCaloriesContainer
${consumedCaloriesTxtAnalyticsAndroid}          id=com.n_ix.pocket_wod:id/consumedCaloriesContainer
${macrosSummaryTxtAnalyticsAndroid}             id=com.n_ix.pocket_wod:id/titleTextView
${weeklyPickerAnalyticsAndroid}                 id=com.n_ix.pocket_wod:id/modeButton
${datePickerAnalyticsAndroid}                   id=com.n_ix.pocket_wod:id/date
${weeklySelectorAnalyticsAndroid}               xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout[2]/android.widget.FrameLayout[4]/android.view.View[2]
${saveDailyBtnAndroid}                          id=com.n_ix.pocket_wod:id/saveButton
${barChartAnalyticsCaloriesAnalyticsAndroid}    id=com.n_ix.pocket_wod:id/chart
${dailyAverageTxtAnalyticsAndroid}              id=com.n_ix.pocket_wod:id/dailyAverageLabel
${highestCaloriesViewAnalyticsAndroid}          id=com.n_ix.pocket_wod:id/highestValueView
${lowestCaloriesViewAnalyticsAndroid}           id=com.n_ix.pocket_wod:id/lowestValueView
${proteinLabelAnalyticsAndroid}                 id=com.n_ix.pocket_wod:id/food_detail_protein_gram
${fatLabelAnalyticsAndroid}                     id=com.n_ix.pocket_wod:id/food_detail_fat_gram
${carbsLabelAnalyticsAndroid}                   id=com.n_ix.pocket_wod:id/food_detail_carbs_gram
${proteinProgressBarAnalyticsAndroid}           id=com.n_ix.pocket_wod:id/proteinProgressBar
${fatProgressBarAnalyticsAndroid}               id=com.n_ix.pocket_wod:id/fatProgressBar
${carbsProgressBarAnalyticsAndroid}             id=com.n_ix.pocket_wod:id/carbsProgressBar
${nutrientsViewAnalyticsAndroid}                id=com.n_ix.pocket_wod:id/nutritionsView
${weightRangePickerAnalyticsAndroid}            id=com.n_ix.pocket_wod:id/modeButton
${weightGraphAnalyticsAndroid}                  id=com.n_ix.pocket_wod:id/chart
${weightLogTxtAnalyticsAndroid}                 id=com.n_ix.pocket_wod:id/weightLogLabel
${addWeightBtnAnalyticsAndroid}                 id=com.n_ix.pocket_wod:id/addWeightButton
${inputWeightFieldAnalyticsAndroid}             id=com.n_ix.pocket_wod:id/weightView
${addWeightBtnCardAnalyticsAndroid}             id=com.n_ix.pocket_wod:id/addBtn
${modePickerAnalyticsAndroid}                   id=com.n_ix.pocket_wod:id/modePicker

#NUTRITION GOALS
${nutritionGoalsBtnAndroid}                     id=com.n_ix.pocket_wod:id/edit_button
${updateNutritionGoalsTxtAndroid}               id=com.n_ix.pocket_wod:id/titleView
${closeNutritionGoalsAndroid}                   id=com.n_ix.pocket_wod:id/closeBtn
${proteinFieldNutritionGoalsAndroid}            id=com.n_ix.pocket_wod:id/proteinEditText
${fatFieldNutritionGoalsAndroid}                id=com.n_ix.pocket_wod:id/fatEditText
${carbsFieldNutritionGoalsAndroid}              id=com.n_ix.pocket_wod:id/carbsEditText
${caloriesFieldNutritionGoalsAndroid}           id=com.n_ix.pocket_wod:id/caloriesEditText
${useRecommendedValBtnNutritionGoalsAndroid}    id=com.n_ix.pocket_wod:id/useRecommendedButton
${updateNutritionGoalsBtnAndroid}               id=com.n_ix.pocket_wod:id/updateButton

*** Keywords ***

Add Weight To The Weight Card Android
    [Arguments]                                             ${userWeightTyepeIntSpaceLbs}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightNutritionBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${weightFieldCardAndroid}
    Wait Until Element Is Visible                           ${addWeightFieldAndroid}
    Clear Text                                              ${addWeightFieldAndroid}
    Input Value                                             ${addWeightFieldAndroid}    ${userWeightTyepeIntSpaceLbs}
    Click Element                                           ${setWeightBtnAndroid}
    Capture Page Screenshot
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightCardBtnAndroid}

Add Water To The Water Card Android
    Wait Until Element Is Visible   ${addWaterNutritionBtnAndroid}
    @{list}=    Create List         ${addWaterNutritionBtnAndroid}
    ...                             ${8ozWaterBtnAndroid}
    ...                             ${12ozWaterBtnAndroid}
    ...                             ${16ozWaterBtnAndroid}
    FOR                             ${item}    IN    @{list}
        Click Element               ${item}
    END
    Capture Page Screenshot
    Click Element                   ${addWaterCardBtnAndroid}
   
#FOOD LOG

Log Food Android
    [Arguments]                                            ${mealButton}    ${foodItem}
    CommonApps.Wait Until Visible And Click Element Apps   ${mealButton}
    Input Value                                            ${foodSearchBarAndroid}    ${foodItem}
    Sleep                                                  2
    Capture Page Screenshot
    Wait Until Page Contains                               ${foodItem}    timeout=10
    CommonApps.Wait Until Visible And Click Element Apps   ${addFirstFoodItemBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps   ${doneAddingFoodBtnAndroid}
    Wait Until Page Contains                               ${foodItem}
    Capture Page Screenshot

Add Custom Food Android
    [Arguments]                                             ${foodName}    ${brandName}    ${servingSize}    ${calories}
    CommonApps.Wait Until Visible And Click Element Apps    ${breakfastBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${addCustomFoodBtnAndroid}
    Wait Until Element Is Visible                           ${customFoodNameFieldAndroid}
    Input Value                                             ${customFoodNameFieldAndroid}    ${foodName}
    Wait Until Element Is Visible                           ${customFoodBrandFieldAndroid}
    Input Value                                             ${customFoodBrandFieldAndroid}    ${brandName}
    Wait Until Element Is Visible                           ${customFoodServingSizeFieldAndroid}
    Input Value                                             ${customFoodServingSizeFieldAndroid}    ${servingSize}
    Wait Until Element Is Visible                           ${customFoodCaloriesFieldAndroid}
    Input Value                                             ${customFoodCaloriesFieldAndroid}    ${calories}
    Capture Page Screenshot
    CommonApps.Wait Until Visible And Click Element Apps    ${addToBreakfastBtnAndroid}
    Wait Until Page Contains                                ${foodName}
    Capture Page Screenshot

#NUTRITION ANALYTICS

Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionAnalyticsTopBtnAndroid}

Close Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${backBtnAnalyticsAndroid}

Review My Day UI - Food Logged Android
    Open Nutrition Analytics Android
    Wait Until Element Is Visible    ${pieChartFourEvementsAnalyticsAndroid}
    @{list}=    Create List          ${breakfastLabelAnalyticsAndroid}
    ...                              ${lunchLabelAnalyticsAndroid}
    ...                              ${dinnerLabelAnalyticsAndroid}
    ...                              ${snaksLabelAnalyticsAndroid}
    ...                              ${dailyCalorieGoalTxtAnalyticsAndroid}
    ...                              ${consumedCaloriesTxtAnalyticsAndroid}
    ...                              ${macrosSummaryTxtAnalyticsAndroid}
    FOR                              ${item}    IN    @{list}
        Element Should Be Visible    ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Review Calories Daily UI - Food Logged Android
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${caloriesBtnAnalyticsAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${weeklyPickerAnalyticsAndroid}
    Wait Until Element Is Visible                           ${modePickerAnalyticsAndroid}
    Swipe By Percent                                        start_x=0    start_y=90
    ...                                                     end_x=0    end_y=95
    Click Element                                           ${saveDailyBtnAndroid}
    Wait Until Element Is Visible                           ${pieChartFourEvementsAnalyticsAndroid}
    @{list}=    Create List                                 ${breakfastLabelAnalyticsAndroid}
    ...                                                     ${lunchLabelAnalyticsAndroid}
    ...                                                     ${dinnerLabelAnalyticsAndroid}
    ...                                                     ${snaksLabelAnalyticsAndroid}
    ...                                                     ${dailyCalorieGoalTxtAnalyticsAndroid}
    ...                                                     ${consumedCaloriesTxtAnalyticsAndroid}
    ...                                                     ${highestCaloriesViewAnalyticsAndroid}
    ...                                                     ${lowestCaloriesViewAnalyticsAndroid}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Review Calories Weekly UI - Food Logged Android
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${caloriesBtnAnalyticsAndroid}
    Wait Until Element Is Visible                           ${barChartAnalyticsCaloriesAnalyticsAndroid}
    @{list}=    Create List                                 ${dailyAverageTxtAnalyticsAndroid}
    ...                                                     ${breakfastLabelAnalyticsAndroid}
    ...                                                     ${lunchLabelAnalyticsAndroid}
    ...                                                     ${dinnerLabelAnalyticsAndroid}
    ...                                                     ${snaksLabelAnalyticsAndroid}
    ...                                                     ${dailyAverageTxtAnalyticsAndroid}
    ...                                                     ${highestCaloriesViewAnalyticsAndroid}
    ...                                                     ${lowestCaloriesViewAnalyticsAndroid}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Review Nutrients Daily UI - Food Logged Android
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutrientsBtnAnalyticsAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${weeklyPickerAnalyticsAndroid}
    Wait Until Element Is Visible                           ${modePickerAnalyticsAndroid}
    Swipe By Percent                                        start_x=0    start_y=90
    ...                                                     end_x=0    end_y=95
    Click Element                                           ${saveDailyBtnAndroid}
    Wait Until Element Is Visible                           ${macrosSummaryTxtAnalyticsAndroid}
    @{list}=    Create List                                 ${proteinProgressBarAnalyticsAndroid}
    ...                                                     ${fatProgressBarAnalyticsAndroid}
    ...                                                     ${carbsProgressBarAnalyticsAndroid}  
    FOR                                                     ${item}    IN    @{list}
        Wait Until Element Is Visible                       ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Review Nutrients Weekly UI - Food Logged Android
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutrientsBtnAnalyticsAndroid}
    Wait Until Element Is Visible                           ${barChartAnalyticsCaloriesAnalyticsAndroid}
    @{list}=    Create List                                 ${proteinLabelAnalyticsAndroid}
    ...                                                     ${carbsLabelAnalyticsAndroid}
    ...                                                     ${fatLabelAnalyticsAndroid}
    ...                                                     ${nutrientsViewAnalyticsAndroid}          
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Review Weight UI - Weight Logged Android
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${weightBtnAnalyticsAndroid}
    Wait Until Element Is Visible                           ${weightGraphAnalyticsAndroid}
    @{list}=    Create List                                 ${weightRangePickerAnalyticsAndroid}
    ...                                                     ${weightLogTxtAnalyticsAndroid}
    ...                                                     ${addWeightBtnAnalyticsAndroid}
    FOR                                                     ${item}    IN    @{list}
        Element Should Be Visible                           ${item}    timeout=10
    END
    Capture Page Screenshot
    Close Nutrition Analytics Android

Add New Weight To The Weight Log Android
    [Arguments]                                             ${userWeightTyepeIntSpaceLbs}
    Open Nutrition Analytics Android
    CommonApps.Wait Until Visible And Click Element Apps    ${weightBtnAnalyticsAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightBtnAnalyticsAndroid}
    Wait Until Element Is Visible                           ${inputWeightFieldAnalyticsAndroid}
    Clear Text                                              ${inputWeightFieldAnalyticsAndroid}
    Input Value                                             ${inputWeightFieldAnalyticsAndroid}    ${userWeightTyepeIntSpaceLbs}
    Click Element                                           ${addWeightBtnCardAnalyticsAndroid}
    Capture Page Screenshot
    Page Should Contain Text                                180
    Capture Page Screenshot
    Close Nutrition Analytics Android

#NUTRITION GOALS

Review Nutrition Goals UI Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtnAndroid}
    Wait Until Element Is Visible                           ${updateNutritionGoalsTxtAndroid}
    @{list}=    Create List                                 PROTEIN
    ...                                                     FAT
    ...                                                     CARBS
    ...                                                     CALORIES
    FOR                                                     ${item}    IN    @{list}
        Text Should Be Visible                              ${item}
    END
    Capture Page Screenshot
    Click Element                                            ${closeNutritionGoalsAndroid}

Update Nutrition Goals For Non-Premium Users Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtnAndroid}
    Wait Until Element Is Visible                           ${updateNutritionGoalsTxtAndroid}
    Clear Text                                              ${caloriesFieldNutritionGoalsAndroid}
    Input Value                                             ${caloriesFieldNutritionGoalsAndroid}   2000
    Capture Page Screenshot
    Click Element                                           ${updateNutritionGoalsBtnAndroid}
    Text Should Be Visible                                  2,000

Use Recommended Values For Non-Premium Users Android
    CommonApps.Wait Until Visible And Click Element Apps    ${nutritionGoalsBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${useRecommendedValBtnNutritionGoalsAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${updateNutritionGoalsBtnAndroid}
    Text Should Be Visible                                  2,150
