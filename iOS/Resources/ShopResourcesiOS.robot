*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${shopBtn}                  xpath=//XCUIElementTypeButton[@name="Shop"]
${shopCloseBtn}             xpath=//XCUIElementTypeButton[@name="ic sideMenu close"]
${shopBackBtn}              xpath=//XCUIElementTypeButton[@name="ic sideMenu back"]
${currentSubscriptionTxt}   xpath=//XCUIElementTypeOther[@name="Current Subscription"]
${nextDeliveryTxt}          xpath=//XCUIElementTypeStaticText[@name="Next Delivery"]
${faqTxt}                   xpath=//XCUIElementTypeStaticText[@name="Frequently Asked Questions"]
${subscriptionDetailsTxt}   xpath=//XCUIElementTypeStaticText[@name="Subscription Details"]
${modifyBtn}                xpath=//XCUIElementTypeButton[@name="Modify"]


*** Keywords ***

Open Shop
    Wait Until Element Is Visible        ${shopBtn}    timeout=30
    Click Element                        ${shopBtn}

Validate Dashboard UI And Details
    Wait Until Page Contains Element     ${currentSubscriptionTxt}    timeout=30
    Page Should Contain Element          ${currentSubscriptionTxt}
    Wait Until Page Contains Element     ${nextDeliveryTxt}    timeout=30
    Page Should Contain Element          ${nextDeliveryTxt}
    Wait Until Page Contains Element     ${faqTxt}    timeout=30
    Page Should Contain Element          ${faqTxt}
    Wait Until Page Contains Element     ${subscriptionDetailsTxt}    timeout=30
    Page Should Contain Element          ${subscriptionDetailsTxt}

Close Shop
    Wait Until Element Is Visible        ${shopCloseBtn}
    Click Element                        ${shopCloseBtn}