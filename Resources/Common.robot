*** Settings ***
Documentation   Common Keywords and Variables to be used across all Features
Library         SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Browser Test
    Log     "Browser Test is starting!"
    Open Browser  about:blank  chrome

End Browser Test
    Log     "Browser Test is ending!"
    Close Browser