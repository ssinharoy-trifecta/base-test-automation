*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

#MAIN FITNESS SCREEN
${fitnessBtniOS}                         xpath=//XCUIElementTypeButton[@name="Fitness"]
${yourFitnessNavigationBarFitnessiOS}    xpath=//XCUIElementTypeNavigationBar[@name="Your fitness"]
${mainMenuBtnFitnessiOS}                 xpath=//XCUIElementTypeButton[@name="ic side menu"]
${favouritesBtnFitnessiOS}               xpath=//XCUIElementTypeButton[@name="ic favourite filled"]
${searchBarFitnessiOS}                   xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField
${workoutsTabFitnessiOS}                 xpath=//XCUIElementTypeStaticText[@name="Workouts"]
${movementsTabFitnessiOS}                xpath=//XCUIElementTypeStaticText[@name="Movements"]
${todaysWorkoutTxtFitnessiOS}            xpath=//XCUIElementTypeStaticText[@name="TODAY'S WORKOUT"]
${viewWorkoutBtnFitnessiOS}              xpath=//XCUIElementTypeButton[@name="View"]
${toolsTxtFitnessiOS}                    xpath=//XCUIElementTypeStaticText[@name="Tools"]
${fitnessTimersBtnFitnessiOS}            xpath=//XCUIElementTypeStaticText[@name="Fitness timers"]
${workoutLogBtnFitnessiOS}               xpath=//XCUIElementTypeStaticText[@name="Workout log"]
${movementLogBtnFitnessiOS}              xpath=//XCUIElementTypeStaticText[@name="Movement log"]
${recentWorkoutsTxtFitnessiOS}           xpath=//XCUIElementTypeStaticText[@name="Recent workouts"]
${topRecentWorkoutFitnessiOS}            xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]
...                                      /XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[2]
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
${followingRecentWorkoutFitnessiOS}      xpath=//XCUIElementTypeApplication[@name="TriDebug"]/XCUIElementTypeWindow
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]
...                                      /XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[1]
...                                      /XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
${viewMoreBtnFitnessiOS}                 //XCUIElementTypeButton[@name="View more"]

#WORKOUTS
${backButtonWorkoutsFitnessiOS}    xpath=//XCUIElementTypeNavigationBar/XCUIElementTypeButton[1]
${workoutMenuFitnessiOS}           xpath=//XCUIElementTypeButton[@name="ic workoutsMenu menu"]
${warmUpTxtFitnessiOS}             xpath=//XCUIElementTypeStaticText[@name="WARM-UP"]
${strengthTxtFitnessiOS}           xpath=//XCUIElementTypeStaticText[@name="STRENGTH"]
${saveWorkoutFitnessiOS}           xpath=//XCUIElementTypeStaticText[@name="Save to my workout library"]
${closeWorkoutMenuiOS}             xpath=//XCUIElementTypeButton[@name="ic workoutsMenu close"][2]

#WORKOUT LOG
${addWodBtnFitnessiOS}         xpath=//XCUIElementTypeButton[@name="wodLogAddButton"]
${wodNameFieldFitnessiOS}      xpath=//XCUIElementTypeApplication[@name="TriDebug"]
...                            /XCUIElementTypeWindow/XCUIElementTypeOther[2]
...                            /XCUIElementTypeOther/XCUIElementTypeOther
...                            /XCUIElementTypeOther/XCUIElementTypeTable
...                            /XCUIElementTypeCell[2]/XCUIElementTypeTextField
${wodResultFieldFitnessiOS}    xpath=//XCUIElementTypeApplication[@name="TriDebug"]
...                            /XCUIElementTypeWindow/XCUIElementTypeOther[2]
...                            /XCUIElementTypeOther/XCUIElementTypeOther
...                            /XCUIElementTypeOther/XCUIElementTypeTable
...                            /XCUIElementTypeCell[4]/XCUIElementTypeTextField
${saveWodBtnFitnessiOS}        xpath=//XCUIElementTypeButton[@name="saveButton"]
${closeWodLogFitnessiOS}       xpath=//XCUIElementTypeNavigationBar[@name="WodLogFrontView"]/XCUIElementTypeButton[1]

#MOVEMENTS
${armsMoveBtnFitnessiOS}           xpath=//XCUIElementTypeButton[@name="Arms"]
${backMoveBtnFitnessiOS}           xpath=//XCUIElementTypeButton[@name="Back"]
${chestMoveBtnFitnessiOS}          xpath=//XCUIElementTypeButton[@name="Chest"]
${coreBtnMoveFitnessiOS}           xpath=//XCUIElementTypeButton[@name="Core"]
${legsBtnMoveFitnessiOS}           xpath=//XCUIElementTypeButton[@name="Legs"]
${allBtnMoveFitnessiOS}            xpath=//XCUIElementTypeButton[@name="All"]
${airAssaultBikeMoveFitnessiOS}    xpath=//XCUIElementTypeStaticText[@name="Air Assault Bike"]
${airSquatMoveFitnessiOS}          xpath=//XCUIElementTypeStaticText[@name="Air Squat"]
${exitMoveVideoBtnFitnessiOS}      xpath=//XCUIElementTypeButton[@name="videoExitButton"]

#TIMERS
${timersTxtFitnessiOS}        xpath=//XCUIElementTypeStaticText[@name="TIMERS"]
${stopwatchBtnFitnessiOS}     xpath=//XCUIElementTypeStaticText[@name="STOPWATCH / FOR TIME"]
${countdownBtnFitnessiOS}     xpath=//XCUIElementTypeStaticText[@name="COUNTDOWN / AMRAP"]
${intervalBtnFitnessiOS}      xpath=//XCUIElementTypeStaticText[@name="INTERVAL / EMOM"]
${tabataBtnFitnessiOS}        xpath=//XCUIElementTypeStaticText[@name="TABATA"]
${cancelTimersFitnessiOS}     xpath=//XCUIElementTypeStaticText[@name="Cancel"]
${startBtnFitnessiOS}         xpath=//XCUIElementTypeStaticText[@name="START"]
${startTimerBtnFitnessiOS}    xpath=//XCUIElementTypeButton[@name="startTimerButton"]
${exitTimerBtnFitnessiOS}     xpath=//XCUIElementTypeButton[@name="exitViewButton"]

*** Keywords ***

Open Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${fitnessBtniOS}

Close Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${nutritionBtniOS}

Review Workout Library UI iOS
    Open Fitness Tab iOS
    @{list}=    Create List                      ${mainMenuBtnFitnessiOS}   
    ...                                          ${yourFitnessNavigationBarFitnessiOS}
    ...                                          ${mainMenuBtnFitnessiOS}
    ...                                          ${favouritesBtnFitnessiOS}
    ...                                          ${searchBarFitnessiOS}
    ...                                          ${workoutsTabFitnessiOS}
    ...                                          ${movementsTabFitnessiOS}
    ...                                          ${todaysWorkoutTxtFitnessiOS}
    ...                                          ${viewWorkoutBtnFitnessiOS}
    ...                                          ${toolsTxtFitnessiOS}
    ...                                          ${fitnessTimersBtnFitnessiOS}
    ...                                          ${workoutLogBtnFitnessiOS}
    ...                                          ${recentWorkoutsTxtFitnessiOS} 
    FOR                                          ${item}     IN     @{list}
        Wait Until Element Is Visible            ${item}
    END
    Capture Page Screenshot
    Close Fitness Tab iOS

Review Workout Details iOS
    Open Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${viewWorkoutBtnFitnessiOS}
    Wait Until Element Is Visible                ${workoutMenuFitnessiOS}
    Wait Until Element Is Visible                ${warmUpTxtFitnessiOS}
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${backButtonWorkoutsFitnessiOS}
    Close Fitness Tab iOS

Save to Workout Library iOS
    Open Fitness Tab iOS
    @{list}=    Create List                          ${viewWorkoutBtnFitnessiOS}
    ...                                              ${workoutMenuFitnessiOS}
    ...                                              ${saveWorkoutFitnessiOS}
    FOR                                              ${item}     IN     @{list}
        Wait Until Visible And Click Element Apps    ${item}
    END
    Wait Until Visible And Click Element Apps        ${backButtonWorkoutsFitnessiOS}
    Close Fitness Tab iOS

Add New Workout For Time iOS
    Open Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${workoutLogBtnFitnessiOS}
    Wait Until Visible And Click Element Apps    ${addWodBtnFitnessiOS}
    Wait Until Element Is Visible                ${wodNameFieldFitnessiOS}
    Input Text                                   ${wodNameFieldFitnessiOS}    Plank
    Wait Until Element Is Visible                ${wodResultFieldFitnessiOS}
    Input Text                                   ${wodResultFieldFitnessiOS}    03:00
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps    ${saveWodBtnFitnessiOS}
    Wait Until Visible And Click Element Apps    ${closeWodLogFitnessiOS}
    Capture Page Screenshot
    Close Fitness Tab iOS

Launch And Validate Timer iOS
    [Arguments]                                      ${timerType}
    Open Fitness Tab iOS
    @{list}=    Create List                          ${fitnessTimersBtnFitnessiOS}
    ...                                              ${timerType}
    ...                                              ${startBtnFitnessiOS}
    ...                                              ${startTimerBtnFitnessiOS}
    FOR                                              ${item}     IN     @{list}
        Wait Until Visible And Click Element Apps    ${item}
    END
    Sleep                                            3
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps        ${exitTimerBtnFitnessiOS}
    Close Fitness Tab iOS

Review Movements Library UI iOS
    Open Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${movementsTabFitnessiOS}
    @{list}=    Create List                      ${armsMoveBtnFitnessiOS} 
    ...                                          ${backMoveBtnFitnessiOS}
    ...                                          ${chestMoveBtnFitnessiOS}
    ...                                          ${coreBtnMoveFitnessiOS}
    ...                                          ${legsBtnMoveFitnessiOS}
    ...                                          ${allBtnMoveFitnessiOS} 
    FOR                                          ${item}     IN     @{list}
        Wait Until Element Is Visible            ${item}
    END
    Click Element                                ${allBtnMoveFitnessiOS}
    Wait Until Element Is Visible                ${airAssaultBikeMoveFitnessiOS}
    Wait Until Element Is Visible                ${airSquatMoveFitnessiOS}
    Capture Page Screenshot
    Close Fitness Tab iOS

Validate Movement Video Content iOS
    Open Fitness Tab iOS
    @{list}=    Create List                         ${movementsTabFitnessiOS} 
    ...                                             ${allBtnMoveFitnessiOS}
    ...                                             ${airAssaultBikeMoveFitnessiOS}
    FOR                                             ${item}     IN     @{list}
        Wait Until Visible And Click Element Apps   ${item}
    END
    Sleep                                           3
    Capture Page Screenshot
    Wait Until Visible And Click Element Apps       ${exitMoveVideoBtnFitnessiOS}
    Close Fitness Tab iOS
