*** Settings ***

Library    AppiumLibrary
Library    BuiltIn
Library    DateTime

*** Variables ***

#EXISTING PREMIUM USER CREDENTIALS
${testUserEmail}       trifectaqa@gmail.com
${testUserPassword}    tester123

#AUTHENTICATION SCREEN OBJECTS
${getStartedBtnAndroid}                  id=com.n_ix.pocket_wod:id/getStartedButton
${credentialsInputFieldPrefixAndroid}    //android.widget.FrameLayout/android.widget.LinearLayout
...                                      /android.widget.FrameLayout/android.widget.LinearLayout
...                                      /android.widget.FrameLayout/android.widget.FrameLayout
...                                      /android.view.ViewGroup/android.widget.FrameLayout
...                                      /android.widget.ScrollView/android.widget.FrameLayout
...                                      /android.widget.LinearLayout/android.view.ViewGroup[
${credentialsInputFieldSuffixAndroid}    ]/android.view.ViewGroup/android.widget.EditText
${emailFieldAuthenticationAndroid}       ${credentialsInputFieldPrefixAndroid}2${credentialsInputFieldSuffixAndroid}
${passwordFieldAuthenticationAndroid}    ${credentialsInputFieldPrefixAndroid}3${credentialsInputFieldSuffixAndroid}
${signInBtnAndroid}                      id=com.n_ix.pocket_wod:id/signInButton
${createAccountBtnAndroid}               id=com.n_ix.pocket_wod:id/createAccountLink
${signUpBtnAndroid}                      id=com.n_ix.pocket_wod:id/signUpButton

*** Keywords ***

Sign Up As New User Android
    @{list}=    Create List              ${getStartedBtnAndroid}  
    ...                                  ${createAccountBtnAndroid}
    FOR                                  ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
        Click Element                    ${item}
    END
    Wait Until Element Is Visible        ${emailFieldAuthenticationAndroid}   timeout=30
    #TODO:This should use probably the CreateCustomer.robot's Generate New eMail Address function
    ${date}    Get Current Date          result_format=%m-%d-%y-%H.%M.%S
    Input Text                           ${emailFieldAuthenticationAndroid}   trifectaqa+${date}@gmail.com
    Input Text                           ${passwordFieldAuthenticationAndroid}    ${testUserPassword}
    Click Element                        ${signUpBtnAndroid}
    @{list}=    Create List              ${athleteImgOnboardingAndroid} 
    ...                                  ${welcomeToTrifectaTxtOnboardingAndroid}
    FOR                                  ${item}     IN     @{list}
        Wait Until Element Is Visible    ${item}    timeout=30
    END

Sign In As Existing User Android
    CommonApps.Wait Until Visible And Click Element Apps    ${getStartedBtnAndroid}
    Wait Until Element Is Visible                           ${emailFieldAuthenticationAndroid}    timeout=20
    Input Text                                              ${emailFieldAuthenticationAndroid}    ${testUserEmail}
    Input Text                                              ${passwordFieldAuthenticationAndroid}    ${testUserPassword}
    Click Element                                           ${signInBtnAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${mainMenuBtnOnAppLoadAndroid}
    CommonApps.Wait Until Visible And Click Element Apps    ${closeMainMenuBtnAndroid}
