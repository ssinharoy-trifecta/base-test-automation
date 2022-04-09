*** Settings ***
Library                         SeleniumLibrary

*** Keywords ***
Click Log Out
    Click Link                  Log Out
    Wait Until Page Contains    You are signed out

Validate My Account Page
    Wait Until Page Contains    My Account
