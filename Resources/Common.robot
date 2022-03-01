*** Settings ***
Documentation               Common Keywords and Variables to be used across all Features
Library                     SeleniumLibrary
Library                     DateTime

*** Variables ***
${currentDate}
${TEST_EMAIL}

*** Keywords ***
Begin Browser Test
    Log                     "Browser Test is starting!"
    Open Browser            ${URL}            ${BROWSER}

End Browser Test
    Log                     "Browser Test is ending!"
    Close Browser

Begin Maximize Browser Test
    Log                     "Browser Test is starting at maximum size!"
    Open Browser            ${URL}            ${BROWSER}
    Set Window Size         2000              1600
    
Initialize Global Variables
    #Create new user with unique email string
    ${currentDate}=         Get Current Date  result_format=%m-%d-%y.%H.%M.%S.%s
    ${TEST_EMAIL}           Set Variable      selenium+${currentDate}\@trifectanutrition.com
    #Use same test email for other tests
    Set Global Variable     ${TEST_EMAIL}
    Log                     ${TEST_EMAIL}