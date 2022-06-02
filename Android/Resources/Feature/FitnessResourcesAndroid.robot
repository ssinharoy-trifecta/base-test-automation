*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN FITNESS SCREEN
${fitnessBtnAndroid}                         //android.widget.FrameLayout[@content-desc="Fitness"]
${yourFitnessNavigationBarFitnessAndroid}    id=com.n_ix.pocket_wod:id/toolbar
${favouritesBtnFitnessAndroid}               id=com.n_ix.pocket_wod:id/savedWorkoutsButton
${searchBarFitnessAndroid}                   id=com.n_ix.pocket_wod:id/searchFieldView
${workoutsTabFitnessAndroid}                 //android.widget.LinearLayout[@content-desc="Workouts"]
${movementsTabFitnessAndroid}                //android.widget.LinearLayout[@content-desc="Movements"]
${todaysWorkoutTxtFitnessAndroid}            id=com.n_ix.pocket_wod:id/todayWorkoutView
${viewWorkoutBtnFitnessAndroid}              id=com.n_ix.pocket_wod:id/startWorkoutBtn
${toolsTxtFitnessAndroid}                    id=com.n_ix.pocket_wod:id/toolsLabel
${fitnessTimersBtnFitnessAndroid}            id=com.n_ix.pocket_wod:id/fitnessTimersButton
${workoutLogBtnFitnessAndroid}               id=com.n_ix.pocket_wod:id/workoutLogButton
${movementLogBtnFitnessAndroid}              id=com.n_ix.pocket_wod:id/movementLogButton
${recentWorkoutsTxtFitnessAndroid}           id=com.n_ix.pocket_wod:id/recentWorkoutsLabel

#WORKOUTS
${backButtonWorkoutsFitnessAndroid}    //android.widget.ImageButton[@content-desc="Navigate up"]
${saveWorkoutFitnessAndroid}           id=com.n_ix.pocket_wod:id/savedWorkoutsButton
${warmUpTxtFitnessAndroid}             id=com.n_ix.pocket_wod:id/titleView

#WORKOUT LOG
${addWodBtnFitnessAndroid}         id=com.n_ix.pocket_wod:id/fab
${wodNameFieldFitnessAndroid}      id=com.n_ix.pocket_wod:id/nameInput
${wodTypeFieldFitnessAndroid}      id=com.n_ix.pocket_wod:id/typeInput
${doneWodTypeBtnFitnessAndroid}    id=com.n_ix.pocket_wod:id/startButton
${wodResultFieldFitnessAndroid}    id=com.n_ix.pocket_wod:id/resultInput
${saveWodBtnFitnessAndroid}        id=com.n_ix.pocket_wod:id/toolbar_back_frame

#MOVEMENTS
${moveCategoryBtnGridFitnessAndroid}   id=com.n_ix.pocket_wod:id/tagsGridView
${exitMoveVideoBtnFitnessAndroid}      id=com.n_ix.pocket_wod:id/close_button

#TIMERS
${timersTxtFitnessAndroid}        id=com.n_ix.pocket_wod:id/text_header
${startBtnFitnessAndroid}         id=com.n_ix.pocket_wod:id/start_button
${startTimerBtnFitnessAndroid}    id=com.n_ix.pocket_wod:id/play_image
${exitTimerBtnFitnessAndroid}     id=com.n_ix.pocket_wod:id/close_image_view
${exitTimerViewFitnessAndroid}    id=com.n_ix.pocket_wod:id/toolbar_close

*** Keywords ***

Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${fitnessBtnAndroid}

Close Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${nutritionBtnAndroid}

Review Workout Library UI Android
    Open Fitness Tab Android
    @{list}=    Create List                      ${yourFitnessNavigationBarFitnessAndroid}
    ...                                          ${favouritesBtnFitnessAndroid}
    ...                                          ${searchBarFitnessAndroid}
    ...                                          ${workoutsTabFitnessAndroid}
    ...                                          ${movementsTabFitnessAndroid}
    ...                                          ${todaysWorkoutTxtFitnessAndroid}
    ...                                          ${viewWorkoutBtnFitnessAndroid}
    ...                                          ${toolsTxtFitnessAndroid}
    ...                                          ${fitnessTimersBtnFitnessAndroid}
    ...                                          ${workoutLogBtnFitnessAndroid}
    ...                                          ${recentWorkoutsTxtFitnessAndroid} 
    FOR                                          ${item}     IN     @{list}
        Wait Until Element Is Visible            ${item}
    END
    Capture Page Screenshot
    Close Fitness Tab Android

Review Workout Details Android
    Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${viewWorkoutBtnFitnessAndroid}
    Wait Until Element Is Visible                ${warmUpTxtFitnessAndroid}
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${backButtonWorkoutsFitnessAndroid}
    Close Fitness Tab Android

Save to Workout Library Android
    Open Fitness Tab Android
    @{list}=    Create List                          ${viewWorkoutBtnFitnessAndroid}
    ...                                              ${saveWorkoutFitnessAndroid}
    ...                                              ${backButtonWorkoutsFitnessAndroid}
    FOR                                              ${item}     IN     @{list}
        Wait Until Visible And Click Element Apps    ${item}
    END
    Close Fitness Tab Android

Add New Workout For Time Android
    Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${workoutLogBtnFitnessAndroid}
    Wait Until Visible And Click Element Apps    ${addWodBtnFitnessAndroid}
    Wait Until Element Is Visible                ${wodNameFieldFitnessAndroid}
    Input Text                                   ${wodNameFieldFitnessAndroid}    Plank
    Wait Until Visible And Click Element Apps    ${wodTypeFieldFitnessAndroid}
    Wait Until Visible And Click Element Apps    ${doneWodTypeBtnFitnessAndroid}
    Wait Until Element Is Visible                ${wodResultFieldFitnessAndroid}
    Input Text                                   ${wodResultFieldFitnessAndroid}    03:00
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${saveWodBtnFitnessAndroid}
    Capture Page Screenshot
    Close Fitness Tab Android

Launch And Validate Timer Android
    [Arguments]                                  ${timerName}
    Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${fitnessTimersBtnFitnessAndroid}
    Wait Until Element Is Visible                ${timersTxtFitnessAndroid}    
    Click Text                                   ${timerName}
    Wait Until Visible And Click Element Apps    ${startBtnFitnessAndroid}
    Wait Until Visible And Click Element Apps    ${startTimerBtnFitnessAndroid}
    Sleep                                        3
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${exitTimerBtnFitnessAndroid}
    Wait Until Visible And Click Element Apps    ${exitTimerViewFitnessAndroid}
    Close Fitness Tab Android

Review Movements Library UI Android
    Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${movementsTabFitnessAndroid}
    Wait Until Element Is Visible                ${moveCategoryBtnGridFitnessAndroid}
    Click Text                                   All
    Wait Until Page Contains                     Air Assault Bike
    Wait Until Page Contains                     Air Squat
    Capture Page Screenshot
    Close Fitness Tab Android

Validate Movement Video Content Android
    Open Fitness Tab Android
    Wait Until Visible And Click Element Apps    ${movementsTabFitnessAndroid} 
    Click Text                                   All
    Click Text                                   Air Assault Bike
    Sleep                                        3
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${exitMoveVideoBtnFitnessAndroid}
    Close Fitness Tab Android
