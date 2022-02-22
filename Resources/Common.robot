*** Settings ***
Documentation   Common Keywords and Variables to be used across all Features
Library         SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Browser Test
    Log     "Browser Test is starting!"
    Open Browser  ${URL}  ${BROWSER}

End Browser Test
    Log     "Browser Test is ending!"
    Close Browser

Begin Maximize Browser Test
    Log     "Browser Test is starting at maximum size!"
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  2000  1600
    