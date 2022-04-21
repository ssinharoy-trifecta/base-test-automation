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
    Wait Until Page Contains Element     ${currentSubscriptionTxtiOS}    timeout=30
    Page Should Contain Element          ${currentSubscriptionTxtiOS}
    Wait Until Page Contains Element     ${nextDeliveryTxtiOS}    timeout=30
    Page Should Contain Element          ${nextDeliveryTxtiOS}
    Wait Until Page Contains Element     ${faqTxtiOS}    timeout=30
    Page Should Contain Element          ${faqTxtiOS}
    Wait Until Page Contains Element     ${subscriptionDetailsTxtiOS}    timeout=30
    Page Should Contain Element          ${subscriptionDetailsTxtiOS}

Close Shop iOS
    Wait Until Element Is Visible        ${shopCloseBtniOS}
    Click Element                        ${shopCloseBtniOS}