*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${shopBtniOS}                  xpath=//XCUIElementTypeButton[@name="Shop"]
${shopCloseBtniOS}             xpath=//XCUIElementTypeButton[@name="ic sideMenu close"]
${shopBackBtniOS}              xpath=//XCUIElementTypeButton[@name="ic sideMenu back"]
${currentSubscriptionTxtiOS}   xpath=//XCUIElementTypeOther[@name="Current Subscription"]
${nextDeliveryTxtiOS}          xpath=//XCUIElementTypeStaticText[@name="Next Delivery"]
${faqTxtiOS}                   xpath=//XCUIElementTypeStaticText[@name="Frequently Asked Questions"]
${subscriptionDetailsTxtiOS}   xpath=//XCUIElementTypeStaticText[@name="Subscription Details"]
${modifyBtniOS}                xpath=//XCUIElementTypeButton[@name="Modify"]


*** Keywords ***

Open Shop iOS
    Wait Until Element Is Visible        ${shopBtniOS}    timeout=30
    Click Element                        ${shopBtniOS}

Validate Dashboard UI And Details iOS
    @{list}=    Create List                 ${currentSubscriptionTxtiOS}  
    ...                                     ${nextDeliveryTxtiOS}
    ...                                     ${faqTxtiOS}
    ...                                     ${subscriptionDetailsTxtiOS} 
    FOR                                     ${item}     IN     @{list}
        Wait Until Page Contains Element    ${item}    timeout=30
    END

Close Shop iOS
    Wait Until Visible And Click Element Apps    ${shopCloseBtniOS}
