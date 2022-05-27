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
    ...                                          ${recentWorkoutsTxtFitnessiOS} 
    FOR                                          ${item}     IN     @{list}
        Wait Until Element Is Visible            ${item}
    END
    Scroll                                       ${recentWorkoutsTxtFitnessiOS}    ${todaysWorkoutTxtFitnessiOS}
    Scroll                                       ${topRecentWorkoutFitnessiOS}    ${followingRecentWorkoutFitnessiOS}
    Scroll                                       ${topRecentWorkoutFitnessiOS}    ${followingRecentWorkoutFitnessiOS}
    Wait Until Visible And Click Element Apps    ${viewMoreBtnFitnessiOS}
    Wait Until Element Is Visible                ${followingRecentWorkoutFitnessiOS}
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
        Wait Until Element Is Visible            ${item}    timeout=30
    END
    Click Element                                ${allBtnMoveFitnessiOS}
    Wait Until Element Is Visible                ${airAssaultBikeMoveFitnessiOS}
    Wait Until Element Is Visible                ${airSquatMoveFitnessiOS}
    Close Fitness Tab iOS

Review Workout Details iOS
    Open Fitness Tab iOS
    Wait Until Visible And Click Element Apps    ${viewWorkoutBtnFitnessiOS}
    @{list}=    Create List                      ${workoutMenuFitnessiOS}
    ...                                          ${warmUpTxtFitnessiOS}
    ...                                          ${strengthTxtFitnessiOS}
    FOR                                          ${item}     IN     @{list}
        Wait Until Element Is Visible            ${item}    timeout=30
    END
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
    Wait Until Visible And Click Element Apps    ${saveWodBtnFitnessiOS}
    Wait Until Visible And Click Element Apps    ${closeWodLogFitnessiOS}
    Close Fitness Tab iOS
