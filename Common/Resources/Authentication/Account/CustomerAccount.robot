*** Settings ***
Library                         SeleniumLibrary

*** Variables ***

*** Keywords ***
Click Log Out
    Click Link                  Log Out
    Wait Until Page Contains    You are signed out