*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#WEIGHT CARD
${addWeightNutritionBtnAndroid}    id=com.n_ix.pocket_wod:id/weight_text_view
${addWeightCardBtnAndroid}         id=com.n_ix.pocket_wod:id/addBtn
${closeWeightCardBtnAndroid}       id=com.n_ix.pocket_wod:id/closeBtn
${weightFieldAndroid}              id=com.n_ix.pocket_wod:id/weightView
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

*** Keywords ***

Add Weight To The Weight Card Android
    [Arguments]                                             ${userWeight}
    CommonApps.Wait Until Visible And Click Element Apps    ${addWeightNutritionBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${weightFieldAndroid}
    Wait Until Element Is Visible                           ${addWeightFieldAndroid}
    Clear Text                                              ${addWeightFieldAndroid}
    Input Value                                             ${addWeightFieldAndroid}    ${userWeight}
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
