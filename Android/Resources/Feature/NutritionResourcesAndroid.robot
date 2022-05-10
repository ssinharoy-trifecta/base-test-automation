*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#TEXT VARIABLES
${foodItem1Android}    Avocado
${foodItem2Android}    Pasta
${foodItem3Android}    Pizza
${foodItem4Android}    Apple
${foodItem5Android}    Test Food Item

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
${breakfastBtnAndroid}                xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.FrameLayout
${lunchBtnAndroid}                    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[2]/android.widget.FrameLayout
${dinnerBtnAndroid}                   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[3]/android.widget.FrameLayout
${snacksBtnAndroid}                   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[4]/android.widget.FrameLayout
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
    Wait Until Element Is Visible    ${addWeightNutritionBtnAndroid}    timeout=20
    Click Element                    ${addWeightNutritionBtnAndroid}
    Wait Until Element Is Visible    ${weightFieldAndroid}    timeout=20
    Click Element                    ${weightFieldAndroid}
    Wait Until Element Is Visible    ${addWeightFieldAndroid}
    Clear Text                       ${addWeightFieldAndroid}
    Input Value                      ${addWeightFieldAndroid}    180
    Click Element                    ${setWeightBtnAndroid}
    Wait Until Element Is Visible    ${addWeightCardBtnAndroid}    timeout=20
    Click Element                    ${addWeightCardBtnAndroid}

Add Water To The Water Card Android
    Wait Until Element Is Visible   ${addWaterNutritionBtnAndroid}    timeout=20
    @{list}=    Create List         ${addWaterNutritionBtnAndroid}
    ...                             ${8ozWaterBtnAndroid}
    ...                             ${12ozWaterBtnAndroid}
    ...                             ${16ozWaterBtnAndroid}
    ...                             ${addWaterCardBtnAndroid}
    FOR    ${item}    IN    @{list}
        Click Element    ${item}
    END

Log Food To Breakfast Android
    Wait Until Element Is Visible   ${breakfastBtnAndroid}    timeout=20
    Click Element                   ${breakfastBtnAndroid}
    Input Value                     ${foodSearchBarAndroid}    ${foodItem1Android}
    Wait Until Page Contains        ${foodItem1Android}    timeout=10
    Wait Until Element Is Visible   ${addFirstFoodItemBtnAndroid}
    Click Element                   ${addFirstFoodItemBtnAndroid}
    Wait Until Element Is Visible   ${doneAddingFoodBtnAndroid}
    Click Element                   ${doneAddingFoodBtnAndroid}
    Wait Until Page Contains        ${foodItem1Android}    timeout=10

Log Food To Lunch Android
    Wait Until Element Is Visible   ${lunchBtnAndroid}    timeout=20
    Click Element                   ${lunchBtnAndroid}
    Input Value                     ${foodSearchBarAndroid}    ${foodItem2Android}
    Wait Until Page Contains        ${foodItem2Android}    timeout=10
    Wait Until Element Is Visible   ${addFirstFoodItemBtnAndroid}
    Click Element                   ${addFirstFoodItemBtnAndroid}
    Wait Until Element Is Visible   ${doneAddingFoodBtnAndroid}
    Click Element                   ${doneAddingFoodBtnAndroid}
    Wait Until Page Contains        ${foodItem2Android}    timeout=10

Log Food To Dinner Android
    Wait Until Element Is Visible   ${dinnerBtnAndroid}    timeout=20
    Click Element                   ${dinnerBtnAndroid}
    Input Value                     ${foodSearchBarAndroid}    ${foodItem3Android}
    Wait Until Page Contains        ${foodItem3Android}    timeout=10
    Wait Until Element Is Visible   ${addFirstFoodItemBtnAndroid}
    Click Element                   ${addFirstFoodItemBtnAndroid}
    Wait Until Element Is Visible   ${doneAddingFoodBtnAndroid}
    Click Element                   ${doneAddingFoodBtnAndroid}
    Wait Until Page Contains        ${foodItem3Android}    timeout=10

Log Food To Snacks Android
    Wait Until Element Is Visible   ${snacksBtnAndroid}    timeout=20
    Click Element                   ${snacksBtnAndroid}
    Input Value                     ${foodSearchBarAndroid}    ${foodItem4Android}
    Wait Until Page Contains        ${foodItem4Android}    timeout=10
    Wait Until Element Is Visible   ${addFirstFoodItemBtnAndroid}
    Click Element                   ${addFirstFoodItemBtnAndroid}
    Wait Until Element Is Visible   ${doneAddingFoodBtnAndroid}
    Click Element                   ${doneAddingFoodBtnAndroid}
    Wait Until Page Contains        ${foodItem4Android}    timeout=10

Add Custom Food Android
    Wait Until Element Is Visible    ${breakfastBtnAndroid}    timeout=20
    Click Element                    ${breakfastBtnAndroid}
    Wait Until Element Is Visible    ${addCustomFoodBtnAndroid}    timeout=10
    Click Element                    ${addCustomFoodBtnAndroid}
    Wait Until Element Is Visible    ${customFoodNameFieldAndroid}    timeout=20
    Input Value                      ${customFoodNameFieldAndroid}    ${foodItem5Android}
    Wait Until Element Is Visible    ${customFoodBrandFieldAndroid}    timeout=20
    Input Value                      ${customFoodBrandFieldAndroid}    Test Brand
    Wait Until Element Is Visible    ${customFoodServingSizeFieldAndroid}    timeout=20
    Input Value                      ${customFoodServingSizeFieldAndroid}    1
    Wait Until Element Is Visible    ${customFoodCaloriesFieldAndroid}    timeout=20
    Input Value                      ${customFoodCaloriesFieldAndroid}    100
    Wait Until Element Is Visible    ${addToBreakfastBtnAndroid}    timeout=20
    Click Element                    ${addToBreakfastBtnAndroid}
    Wait Until Page Contains         ${foodItem5Android}    timeout=10
