*** Settings ***

Library    AppiumLibrary

*** Keywords ***

Wait Until Visible And Click Element Apps
    [Arguments]                                    ${elementApps}
    AppiumLibrary.Wait Until Element Is Visible    ${elementApps}    timeout=10
    AppiumLibrary.Click Element                    ${elementApps}
