*** Settings ***

Library    AppiumLibrary

*** Keywords ***

Wait Until Visible And Click Element Apps
    [Arguments]                                    ${elementApps}
    AppiumLibrary.Wait Until Element Is Visible    ${elementApps}
    AppiumLibrary.Click Element                    ${elementApps}
  