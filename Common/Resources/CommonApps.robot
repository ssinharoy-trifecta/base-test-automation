*** Settings ***

Library    AppiumLibrary

*** Keywords ***

Wait Until Visible And Click Element Apps
    [Arguments]                                    ${elementApps}
    AppiumLibrary.Wait Until Element Is Visible    ${elementApps}    timeout=10
    AppiumLibrary.Click Element                    ${elementApps}

Loop Through List And Wait Until Visible
    [Arguments]                                             ${list}
    FOR                                                     ${items}    IN    @{list}
        Wait Until Element Is Visible                       ${items}
    END
